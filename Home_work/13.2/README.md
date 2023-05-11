## Задание 1

#### 1.1 deployment busybox и multitool

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pvc
  labels:
    app: pvc
spec:
  replicas: 1
  selector:
    matchLabels:
      app: pvc
  template:
    metadata:
      labels:
        app: pvc
    spec:
      containers:
      - image: busybox
        name: bussybox
        command: ['sh', '-c', 'while true; do echo $PATH >> /input/test.txt; sleep 5s; done']
        volumeMounts:
        - name: config
          mountPath: /input
      - image: docker.io/wbitt/network-multitool:latest
        name: multitool
        volumeMounts:
        - name: config
          mountPath: /output
      volumes:
       - name: config
         persistentVolumeClaim:
           claimName: pv-local
```

#### 1.2 PV и PVC

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-local
  labels:
    app: main
spec:
  persistentVolumeReclaimPolicy: Delete
  storageClassName: ''
  accessModes:
    - ReadWriteMany
  capacity:
    storage: 1Gi
  hostPath:
    path: /tmp
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pv-local
spec:
  storageClassName: ""
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
```

#### 1.3 Демонстрация, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/13.2/output.PNG?raw=true "Optional Title")

#### 1.4 Удаляем deployment и PVC, после удаление PVC PV потерял связь с PVC и видно ошибку PV, но данный файл останется на ноде и не удалится

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/13.2/delete_pvc.PNG?raw=true "Optional Title")

#### 1.5 Удаляем PV, как видим после удаления PV файл остался на ноде и читается

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/13.2/devete_pv.PNG?raw=true "Optional Title")




## Задание 2

#### 2.2 deployment multitool

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pvc
  labels:
    app: pvc
spec:
  replicas: 1
  selector:
    matchLabels:
      app: pvc
  template:
    metadata:
      labels:
        app: pvc
    spec:
      containers:
      - image: docker.io/wbitt/network-multitool:latest
        name: multitool
        volumeMounts:
        - name: config
          mountPath: /mnt-nfs
      volumes:
       - name: config
         persistentVolumeClaim:
           claimName: my-pvc
```

#### PVC-NFS, StorageClass

```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-csi
provisioner: nfs.csi.k8s.io
parameters:
  server: 127.0.0.1
  share: /srv/nfs
reclaimPolicy: Delete
volumeBindingMode: Immediate
mountOptions:
  - hard
  - nfsvers=4
```

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  storageClassName: nfs-csi
  accessModes: [ReadWriteOnce]
  resources:
    requests:
      storage: 1Gi
```

#### 2.3 Проверяем возможность чтения и записи внутри пода 


![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/13.2/pvc_nfs.PNG?raw=true "Optional Title")
