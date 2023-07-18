resource "yandex_iam_service_account" "ig-sa" {
  name        = "ig-sa"
  description = "service account to manage IG"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = "b1gf9lcio0r7vnajphej"
  role      = "editor"
  member   = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
}

resource "yandex_compute_instance_group" "ig-1" {
  name               = "fixed-ig-with-balancer"
  folder_id          = "b1gf9lcio0r7vnajphej"
  service_account_id = "${yandex_iam_service_account.ig-sa.id}"
  deletion_protection = "false"
  instance_template {
    platform_id = "standard-v3"
    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
      }
    }

    network_interface {
      network_id = "${yandex_vpc_network.network-1.id}"
      subnet_ids = ["${yandex_vpc_subnet.subnet-1.id}"]
    }

    metadata = {
      ssh-keys = "root:RGTQHxmmMSCeAWQv60wVRsWMQAwP/tDYxerLgxTEL2H9q3sbbgBcgQChOUBZardCl3FS4yfW4MfID09sSQU3RpavLf7WFzbC1ZKxKcd0881p0v8XnFx6onMgJba5+SL3VuEP+qfN4InQ1AMIorrplFiU3A6gTdCXJiimcBw9nSYg1x29bTNDbULDhU7j9//qRAkrO7nwXea1bl/AMt7cKdonBKJi+r/C7hF"
      "user-data" = <<-EOT
      #!/bin/bash
      echo "<img src="https://storage.yandexcloud.net/maks1001281/bmw_fary_podsvetka_137326_2560x1080.jpg">" > /var/www/html/index.html
    EOT   
}
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "load balancer target group"
  }
}

resource "yandex_lb_network_load_balancer" "lb-1" {
  name = "network-load-balancer-1"

  listener {
    name = "network-load-balancer-1-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.ig-1.load_balancer.0.target_group_id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.network-1.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}

