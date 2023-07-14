resource "yandex_compute_instance" "peivatevm" {
  hostname        = "privatevm"
  name        = "privatevm"
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
      image_id = "fd8unsmfpl9uk01uodf2"
      size     = "20"
      type     = "network-nvme"


    }
  }



 network_interface {
    subnet_id = "${yandex_vpc_subnet.private.id}"
  }



  metadata = {
    foo      = "bar"
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

