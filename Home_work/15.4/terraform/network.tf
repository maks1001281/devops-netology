resource "yandex_vpc_network" "localcloud" {
  name = "localcloud"
}

resource "yandex_vpc_subnet" "public50" {
  v4_cidr_blocks = ["192.168.50.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "public50"
}

resource "yandex_vpc_subnet" "public60" {
  v4_cidr_blocks = ["192.168.60.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "public60"
}


resource "yandex_vpc_subnet" "public70" {
  v4_cidr_blocks = ["192.168.70.0/24"]
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "public70"
}

resource "yandex_vpc_subnet" "private20" {
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "private20"
}

resource "yandex_vpc_subnet" "private30" {
  v4_cidr_blocks = ["192.168.30.0/24"]
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "private30"
}

resource "yandex_vpc_subnet" "private40" {
  v4_cidr_blocks = ["192.168.40.0/24"]
  zone           = "ru-central1-c"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "private40"
}
