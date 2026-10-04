### Выполненный Playbook

![ansible](ansible.PNG)

### Подключаемся к мастер ноде и копируем config file
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### Делаем запрос

![node](node.PNG)

### Проверяем работу кластера с контейнером nginx

![pods](pods.PNG)

### Скрин машин с YC

![yc](yc.PNG)


### Файлы Terraform 

[Terraform](terraform)