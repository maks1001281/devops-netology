variable "cloud_id" {
  description = "Идентификатор облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "Идентификатор каталога Yandex Cloud"
  type        = string
}

variable "k8s_api_allowed_cidrs" {
  description = "Сети, из которых разрешён доступ к API Kubernetes (порты 443 и 6443)"
  type        = list(string)
}

variable "mysql_password" {
  description = "Пароль пользователя netology в кластере MySQL"
  type        = string
  sensitive   = true
}
