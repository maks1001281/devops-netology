## Задание 1

#### Deployment

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-multitool
  labels:
    app: nginx-multitool
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-multitool
  template:
    metadata:
      labels:
        app: nginx-multitool
    spec:
      containers:
      - image: nginx:latest
        name: nginx
        ports:
        - containerPort: 80
      - image: docker.io/wbitt/network-multitool:latest
        name: multitool
        ports:
        - containerPort: 8080
        env:
        - name: HTTP_PORT
          value: "8080"
```

#### Service

```
apiVersion: v1
kind: Service
metadata:
  name: nginx-multitool
spec:
  ports:
  - name: nginx
    protocol: TCP
    port: 9001
    targetPort: 80
  - name: multitool
    protocol: TCP
    port: 9002
    targetPort: 8080
  selector:
    app: nginx-multitool
```

#### Отдельный pods для проверки curl запросов

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-multitool
spec:
  containers:
  - name: multitool
    image: docker.io/wbitt/network-multitool:latest
    env:
    - name: HTTP_PORT
      value: "1280"
```

#### Curl запрос на service

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.4/curl9001.PNG?raw=true "Optional Title")

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.4/curl9002.PNG?raw=true "Optional Title")

## Задание 2 

#### Service nodePort

```
apiVersion: v1
kind: Service
metadata:
  name: nginx-multitool-nodeport
spec:
  type: NodePort
  ports:
  - name: nginx
    protocol: TCP
    port: 9003
    targetPort: 80
    nodePort: 32500
  selector:
    app: nginx-multitool
```

#### Запрос с браузера

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.4/nodeport.PNG?raw=true "Optional Title")
