
locals {
  cloud_id    = "b1gvqruc4vs0jmq1sqh2"
  folder_id   = "b1gf9lcio0r7vnajphej"
  k8s_version = "1.26"
  sa_name     = "root"
}


resource "yandex_kubernetes_cluster" "k8s-regional" {
  network_id = yandex_vpc_network.localcloud.id
  name = "kubernetes"
  master {
    version = local.k8s_version
    regional {
      region = "ru-central1"
      location {
        zone      = yandex_vpc_subnet.public50.zone
        subnet_id = yandex_vpc_subnet.public50.id
      }
      location {
        zone      = yandex_vpc_subnet.public60.zone
        subnet_id = yandex_vpc_subnet.public60.id
      }
      location {
        zone      = yandex_vpc_subnet.public70.zone
        subnet_id = yandex_vpc_subnet.public70.id
      }
    }
    public_ip = true
    security_group_ids = [yandex_vpc_security_group.k8s-main-sg.id]
  }
  service_account_id      = yandex_iam_service_account.kubernetes.id
  node_service_account_id = yandex_iam_service_account.kubernetes.id
  depends_on = [
    yandex_resourcemanager_folder_iam_member.kubernetes
  ]
  kms_provider {
    key_id = yandex_kms_symmetric_key.key-a.id
  }
}

resource "yandex_iam_service_account" "kubernetes" {
  name        = "kubernetes"
  description = "K8S regional service account"
}

resource "yandex_resourcemanager_folder_iam_member" "kubernetes" {
  # Сервисному аккаунту назначается роль "k8s.clusters.agent".
  folder_id = "b1gf9lcio0r7vnajphej"
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.kubernetes.id}"
}


resource "yandex_kms_symmetric_key" "key-a" {
  # Ключ для шифрования важной информации, такой как пароли, OAuth-токены и SSH-ключи.
  name              = "kms-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}


resource "yandex_vpc_security_group" "k8s-main-sg" {
  name        = "k8s-main-sg"
  description = "Правила группы обеспечивают базовую работоспособность кластера Managed Service for Kubernetes. Примените ее к кластеру Managed Service for Kubernetes и группам узлов."
  network_id  = yandex_vpc_network.localcloud.id
  ingress {
    protocol       = "TCP"
    description    = "Правило разрешает подключение к API Kubernetes через порт 6443 из указанной сети."
    v4_cidr_blocks = ["37.192.231.178/32"]
    port           = 6443
  }
  ingress {
    protocol       = "TCP"
    description    = "Правило разрешает подключение к API Kubernetes через порт 443 из указанной сети."
    v4_cidr_blocks = ["37.192.231.178/32"]
    port           = 443
  }
  ingress {
    protocol          = "TCP"
    description       = "Правило разрешает проверки доступности с диапазона адресов балансировщика нагрузки. Нужно для работы отказоустойчивого кластера Managed Service for Kubernetes и сервисов балансировщика."
    predefined_target = "loadbalancer_healthchecks"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol          = "ANY"
    description       = "Правило разрешает взаимодействие мастер-узел и узел-узел внутри группы безопасности."
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol          = "ANY"
    description       = "Правило разрешает взаимодействие под-под и сервис-сервис. Укажите подсети вашего кластера Managed Service for Kubernetes и сервисов."
    v4_cidr_blocks    = concat(yandex_vpc_subnet.public50.v4_cidr_blocks, yandex_vpc_subnet.public60.v4_cidr_blocks, yandex_vpc_subnet.public70.v4_cidr_blocks)
    from_port         = 0
    to_port           = 65535
  }
  ingress {
    protocol          = "ICMP"
    description       = "Правило разрешает отладочные ICMP-пакеты из внутренних подсетей."
    v4_cidr_blocks    = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
  }
  ingress {
    protocol          = "TCP"
    description       = "Правило разрешает входящий трафик из интернета на диапазон портов NodePort. Добавьте или измените порты на нужные вам."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 30000
    to_port           = 32767
  }
  egress {
    protocol          = "ANY"
    description       = "Правило разрешает весь исходящий трафик. Узлы могут связаться с Yandex Container Registry, Yandex Object Storage, Docker Hub и т. д."
    v4_cidr_blocks    = ["0.0.0.0/0"]
    from_port         = 0
    to_port           = 65535
  }
}

  resource "yandex_kubernetes_node_group" "group" {
    cluster_id = yandex_kubernetes_cluster.k8s-regional.id
    version = "1.26"

    allocation_policy{
        location{
            zone = yandex_vpc_subnet.public50.zone
        }
    }

    instance_template {
            metadata = {
            user-data = "${file("./user.conf")}"
}
            boot_disk {
            type = "network-hdd"
            size = 64
        }
        platform_id = "standard-v2"
    network_interface {
      subnet_ids = [yandex_vpc_subnet.public50.id]
      nat = true
    }
}
  scale_policy {
    auto_scale {
      min     = 3
      max     = 6
      initial = 3
    }
  }
}
