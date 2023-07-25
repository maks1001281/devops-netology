resource "yandex_mdb_mysql_cluster" "mysql" {
  name                = "mysql"
  environment         = "PRESTABLE"
  network_id          = "${yandex_vpc_network.localcloud.id}"
  version             = "8.0"
  deletion_protection = true

backup_window_start {
    hours   = 23
    minutes = 59
  }

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = "10"
  }

 timeouts {
    create = "1h30m" # Полтора часа
    update = "2h"    # 2 часа
    delete = "30m"   # 30 минут
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.private20.id
  }

  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.private30.id
  }

  host {
    zone      = "ru-central1-c"
    subnet_id = yandex_vpc_subnet.private40.id
  }
}

resource "yandex_mdb_mysql_database" "netology_db" {
  cluster_id = yandex_mdb_mysql_cluster.mysql.id
  name       = "netology_db"
}

resource "yandex_mdb_mysql_user" "netology" {
  cluster_id = yandex_mdb_mysql_cluster.mysql.id
  name       = "netology"
  password   = "netology"
  permission {
    database_name = yandex_mdb_mysql_database.netology_db.name
    roles         = ["ALL"]
  }
}
