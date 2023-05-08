## Задание 1

#### deployment "busybox и multitool"

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: multitool
  labels:
    app: multitool
spec:
  replicas: 1
  selector:
    matchLabels:
      app: multitool
  template:
    metadata:
      labels:
        app: multitool
    spec:
      containers:
      - image: busybox
        name: bussybox
        command: ['sh', '-c', 'while true; do echo $PATH >> /input/test.txt; sleep 5s; done']
        volumeMounts:
        - mountPath: /input
          name: bussybox-multitool
      - image: docker.io/wbitt/network-multitool:latest
        name: multitool
        volumeMounts:
        - mountPath: /output
          name: bussybox-multitool
      volumes:
        - name: bussybox-multitool
          emptyDir: {}
```

#### Чтение лога после применения deployment

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/13.1/path.PNG?raw=true "Optional Title")

## Задание 2

#### DaemonSet

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: multitool
  labels:
    app: multitool
spec:
  selector:
    matchLabels:
      app: multitool
  template:
    metadata:
      labels:
        app: multitool
    spec:
      containers:
      - image: docker.io/wbitt/network-multitool:latest
        name: multitool
        volumeMounts:
        - mountPath: /var/log
          name: varlog
      volumes:
      - name: varlog
        hostPath:
          path: /var/log
```

#### Чтение логов после применения DaemonSet

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/13.1/logs.PNG?raw=true "Optional Title")
