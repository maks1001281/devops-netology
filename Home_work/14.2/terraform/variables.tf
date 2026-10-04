variable "node_count" {
  description = "Количество рабочих нод"
  type        = number
  default     = 4
}

variable "image_id" {
  description = "Идентификатор образа для загрузочного диска"
  type        = string
  default     = "fd8qes7jgsjvuudp80td"
}

variable "subnet_id" {
  description = "Идентификатор подсети, в которой создаются машины"
  type        = string
  default     = "e9bq93otsvu9tqle1mt1"
}
