## Задача 1
### Текс Dockerfile

```
FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.5@sha256:76344d5f89b13147743db0487eb76b03a7f9f0cd55abe8ab887069711f2ee27d

ENV     ES_HOME=/var/lib/elasticsearch
ENV     ES_USER=elasticsearch
ENV     ES_PATH_CONF=/var/lib/elasticsearch/config
COPY    config/ /var/lib/elasticsearch/config
RUN     mkdir /var/lib/elasticsearch/snapshots
RUN     chown -R elasticsearch:elasticsearch /var/lib/elasticsearch
WORKDIR ${ES_HOME}
USER    ${ES_USER}
EXPOSE  9200 9300
```

### Ссылка на образ :

[hub.docker.com](https://hub.docker.com/r/1001281/elc/tags)

### Ответ elasticsearch на запрос пути / в json виде:

```
{
  "name" : "netology_test",
  "cluster_name" : "netology",
  "cluster_uuid" : "3N5cCp1fS12TKsLIIWwCSQ",
  "version" : {
    "number" : "7.17.5",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "8d61b4f7ddf931f219e3745f295ed2bbc50c8e84",
    "build_date" : "2022-06-23T21:57:28.736740635Z",
    "build_snapshot" : false,
    "lucene_version" : "8.11.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}

```

## Задача 2
### Получаем список индексов:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.5/index.PNG?raw=true "Optional Title")

### Получаем состояние кластера elasticsearch(На момент завершения третьего задания):

```
curl -XGET localhost:9200/_cluster/health/?pretty

```

```
{
  "cluster_name" : "netology",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 5,
  "active_shards" : 5,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
}
```

### Как вы думаете, почему часть индексов и кластер находится в состоянии yellow:
###### Состояние желтое тк кластер состоит из одной ноды и потеря ноды приведет к потере данных

### Задача 3
### Создаем репозиторий:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.5/createrepo.PNG?raw=true "Optional Title")

### Приводим список индксов:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.5/testindex.PNG?raw=true "Optional Title")

### Папка с файлами снапшотов:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.5/filebackup.PNG?raw=true "Optional Title")

###  Новый список индексов:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.5/test2.PNG?raw=true "Optional Title")

### Восстанавливаем список индексов из снапшота:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.5/restore.PNG?raw=true "Optional Title")

### Запрос:

```
curl -X POST localhost:9200/_snapshot/netology_backup/my_snapshot/_restore?pretty -H 'Content-Type: application/json' -d'{ "indices" : "test" }'

```


