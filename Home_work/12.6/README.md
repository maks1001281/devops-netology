### Файл gitlab-ci.yml

```
stages:
  - build
image: centos:7
variables:
  GIT_STRATEGY: clone
builder:
  tags:
    - docker
  stage: build
  script:
    - sudo docker build -t centos7:gitlab .
    - sudo docker image tag centos7:gitlab  www.maks100128.ru:5050/root/gitlab/centos7:gitlab
    - sudo docker push www.maks100128.ru:5050/root/gitlab/centos7:gitlab
```

### Dockerfile

```
FROM centos:7

RUN  yum -y update
RUN  yum -y install epel-release
RUN  yum install wget make cmake gcc bzip2-devel libffi-devel zlib-devel -y
RUN  yum -y groupinstall "Development Tools"
RUN  yum install python3 python3-pip -y
RUN  wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz
RUN  tar xvf Python-3.9.0.tgz
RUN  cd Python-3.9.0
RUN  yum -y install openssl openssl-devel
RUN  gcc --version
RUN  Python-3.9.0/configure --enable-optimizations
RUN  make altinstall
COPY requirements.txt requirements.txt
RUN pip3.9 install -r requirements.txt
RUN yum install -y htop nano mc
RUN mkdir python_api
COPY app.py python_api/app.py
RUN cd python_api
CMD python3.9 python_api/app.py
```

### Лог успешного выполнения пайплайна

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.6/pupeline.PNG?raw=true "Optional Title")

### Решеный Issue

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.6/task1.PNG?raw=true "Optional Title")

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.6/task2.PNG?raw=true "Optional Title")

### Web запрос после выполнения Issue

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/12.6/web.PNG?raw=true "Optional Title")
