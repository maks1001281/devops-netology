resource "yandex_compute_instance" "nat" {
  hostname        = "nat"
  name        = "nat"
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
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = "10"
      type     = "network-nvme"


    }
  }



 network_interface {
    subnet_id = "${yandex_vpc_subnet.public.id}"
    ip_address = "192.168.10.254"
    nat       = true
  }



  metadata = {
    foo      = "bar"
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

