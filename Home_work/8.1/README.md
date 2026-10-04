## Задание 1

![1](1.PNG)

## Задание 2

![2](2.PNG)

## Задание 3

### Делал подключение в локальной сети к своим виртуальным машинам на Ubuntu 1.24, 1.25

## Задание 4

![4](4.PNG)

## Задание 5

### Дописал значения в deb и el

## Задание 6

![5](5.PNG)

## Задание 7

![7](7.PNG)

## Задание 8

![8](8.PNG)

## Задание 9

### Не нашел ничего с помощью команды ansible-doc но нешел в оф мануале ansible

![9](9.PNG)

## Задание 10

```
---
  el:
    hosts:
      ubuntu16.04:
        ansible_host: 192.168.1.24
        ansible_user: user
        ansible_password: user
  deb:
    hosts:
      ubuntu20.04:
        ansible_host: 192.168.1.25
        ansible_user: user
        ansible_password: user
  local:
   hosts:
    local:
      ansible_host: 127.0.0.1
      ansible_user: maks
      ansible_password: 1
```
## Задание 11

![10](10.PNG)

