resource "yandex_vpc_network" "localcloud" {
  name = "localcloud"
}

resource "yandex_vpc_subnet" "public" {
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "public"
}

resource "yandex_vpc_subnet" "private" {
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.localcloud.id}"
  name           = "private"
  route_table_id = yandex_vpc_route_table.route-nat.id
}

resource "yandex_vpc_route_table" "route-nat" {
  network_id = "${yandex_vpc_network.localcloud.id}"

  static_route { 
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

