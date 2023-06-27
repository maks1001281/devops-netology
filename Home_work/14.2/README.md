### Выполненный Playbook

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/14.2/ansible.PNG?raw=true "Optional Title")

### Подключаемся к мастер ноде и копирием config file
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### Делаем запрос

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/14.2/node.PNG?raw=true "Optional Title")

### Проверяем работу кластера с контейнером nginx

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/14.2/pods.PNG?raw=true "Optional Title")

### Скрин машин с YC

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/14.2/yc.PNG?raw=true "Optional Title")


### Файлы Terraform 

[Terraform](https://github.com/maks1001281/devops-netology/blob/main/Home_work/14.2/terraform)