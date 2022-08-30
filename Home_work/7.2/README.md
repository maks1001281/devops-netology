## Задача 1

#### Использовать AWS нет возможности, тк при регистрации просит указать российский номер, а с российскими нельзя регестрироваться, буду использовать YC.

##### Возникли проблемы с обьявлением переменной token ключа, делал все по инструкции но terraform не хочет его воспринимать в виде переменной, использовал чистый token ключ.

## Задача 2

### Terraform init:

```
[root@deploy terraform]# terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of yandex-cloud/yandex from the dependency lock file
- Using previously-installed yandex-cloud/yandex v0.77.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```

### При выполнении Terraform плана создается машина в yc из образа собраного с помощью packer:

```
[root@deploy terraform]# terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.centos will be created
  + resource "yandex_compute_instance" "centos" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + metadata                  = {
          + "foo"      = "bar"
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa XXXXXXXXXXXX
        }
      + name                      = "centos"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8h8ak5i1sgqhnrs8ho"
              + name        = (known after apply)
              + size        = 30
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = "e9bq93otsvu9tqle1mt1"
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 2
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_vpc_network.default will be created
  + resource "yandex_vpc_network" "default" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "net"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.default will be created
  + resource "yandex_vpc_subnet" "default" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.101.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 3 to add, 0 to change, 0 to destroy.
yandex_vpc_network.default: Creating...
yandex_compute_instance.centos: Creating...
yandex_vpc_network.default: Creation complete after 2s [id=enpvr6emsc194oo86iuf]
yandex_vpc_subnet.default: Creating...
yandex_vpc_subnet.default: Creation complete after 1s [id=e9b97vbovvqmkfup5fii]
yandex_compute_instance.centos: Still creating... [10s elapsed]
yandex_compute_instance.centos: Still creating... [20s elapsed]
yandex_compute_instance.centos: Still creating... [30s elapsed]
yandex_compute_instance.centos: Still creating... [40s elapsed]
yandex_compute_instance.centos: Still creating... [50s elapsed]
yandex_compute_instance.centos: Creation complete after 57s [id=fhm9mfb413cs8tmjr2mq]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

```

### При помощи какого инструмента (из разобранных на прошлом занятии) можно создать свой образ ami?
##### С помощь Terraform и Packer



