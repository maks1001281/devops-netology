# devops-netology

Домашние задания курса «DevOps-инженер» (Нетология), 2022–2023.
Каждое задание лежит в отдельном каталоге `Home_work/<номер>` и содержит `README.md` с решением.

## Содержание

| Модуль | Темы | Задания |
|:------:|------|---------|
| 5 | Виртуализация, Docker Swarm | [5.5](Home_work/5.5) |
| 6 | Базы данных: выбор СУБД, SQL, MySQL, PostgreSQL, Elasticsearch, поиск неисправностей | [6.1](Home_work/6.1) · [6.2](Home_work/6.2) · [6.3](Home_work/6.3) · [6.4](Home_work/6.4) · [6.5](Home_work/6.5) · [6.6](Home_work/6.6) |
| 7 | Инфраструктура как код: Terraform, Packer, Yandex Cloud | [7.1](Home_work/7.1) · [7.2](Home_work/7.2) |
| 8 | Ansible: плейбуки, роли, тестирование в Molecule | [8.1](Home_work/8.1) · [8.2](Home_work/8.2) · [8.3](Home_work/8.3) · [8.4](Home_work/8.4) · [8.5](Home_work/8.5) |
| 9 | CI/CD: Jira, SonarQube, Nexus, Maven, Jenkins | [9.1](Home_work/9.1) · [9.3](Home_work/9.3) · [9.4](Home_work/9.4) |
| 10 | Мониторинг и логирование: Grafana, стек ELK, разбор инцидента | [10.2](Home_work/10.2) · [10.3](Home_work/10.3) · [10.4](Home_work/10.4) · [10.5](Home_work/10.5) · [10.6](Home_work/10.6) |
| 11 | Микросервисная архитектура | [11.1](Home_work/11.1) · [11.2](Home_work/11.2) · [11.3](Home_work/11.3) · [11.4](Home_work/11.4) |
| 12 | Kubernetes: поды, деплойменты, сервисы; GitLab CI | [12.1](Home_work/12.1) · [12.2](Home_work/12.2) · [12.3](Home_work/12.3) · [12.4](Home_work/12.4) · [12.6](Home_work/12.6) |
| 13 | Kubernetes: тома, ConfigMap и Secret, Helm | [13.1](Home_work/13.1) · [13.2](Home_work/13.2) · [13.3](Home_work/13.3) · [13.5](Home_work/13.5) |
| 14 | Kubernetes: развёртывание кластера, сетевые политики, обновление приложений | [14.1](Home_work/14.1) · [14.2](Home_work/14.2) · [14.3](Home_work/14.3) · [14.4](Home_work/14.4) · [14.5](Home_work/14.5) |
| 15 | Yandex Cloud: сети и NAT, Object Storage и группы ВМ, KMS, Managed Kubernetes и MySQL | [15.1](Home_work/15.1) · [15.2](Home_work/15.2) · [15.3](Home_work/15.3) · [15.4](Home_work/15.4) |

## Запуск Terraform-примеров

Идентификаторы облака и каталога, разрешённые адреса и пароли вынесены в переменные.
Передайте их через `terraform.tfvars` (в git не попадает) или переменные окружения `TF_VAR_*`;
пример файла — [`Home_work/15.4/terraform/terraform.tfvars.example`](Home_work/15.4/terraform/terraform.tfvars.example).
Токен Yandex Cloud задаётся переменной окружения `YC_TOKEN`.
