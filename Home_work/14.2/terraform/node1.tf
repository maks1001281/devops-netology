resource "yandex_compute_instance" "node1" {
  hostname        = "node1"
  name        = "node1"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 4
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

