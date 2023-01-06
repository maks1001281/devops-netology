terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = ""
  cloud_id  = "b1gvqruc4vs0jmq1sqh2"
  folder_id = "b1gf9lcio0r7vnajphej"
  zone      = "ru-central1-a"
}

