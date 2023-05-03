## Задание 1 Pods

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.2/pods.PNG?raw=true "Optional Title")

```
apiVersion: v1
kind: Pod
metadata:
  name: echoserver
spec:
  containers:
  - name: echoserver
    image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
    ports:
    - containerPort: 8443
```

## Задание 2 Service

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.2/service.PNG?raw=true "Optional Title")

```
apiVersion: v1
kind: Pod
metadata:
  name: netology-web
  labels:
    app.kubernetes.io/name: netology-web
spec:
  containers:
  - name: netology-web
    image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
    ports:
      - containerPort: 8443
        name: http-web-svc

---
apiVersion: v1
kind: Service
metadata:
  name: netology-svc
spec:
  selector:
    app.kubernetes.io/name: netology-web
  ports:
  - name: echoserver
    protocol: TCP
    port: 9090
    targetPort: http-web-svc
```

#### kubectl get pods

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.2/get.PNG?raw=true "Optional Title")
