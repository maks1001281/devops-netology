resource "yandex_compute_instance" "ubuntu2204" {
  name        = "node0"
  hostname = "node0"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

 scheduling_policy {
    preemptible = true
 }

  boot_disk {
    initialize_params {
      image_id = "fd8qes7jgsjvuudp80td"
      size     = "30"
      type     = "network-nvme"


    }
  }

  network_interface {
    subnet_id = "e9bq93otsvu9tqle1mt1"
    nat       = true
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "default" {
  name = "net"
}

resource "yandex_vpc_subnet" "default" {
  name = "subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.101.0/24"]
}

