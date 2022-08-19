## Задача 1
### Docker compose file:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/docker.PNG?raw=true "Optional Title")

### Статус БД \s :

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/info.PNG?raw=true "Optional Title")

### Колличество записей price > 300:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/price.PNG?raw=true "Optional Title")

## Задача 2
### SQL запросы:

CREATE USER test

 ALTER USER test
    IDENTIFIED BY 'test-pass'
    WITH
    MAX_QUERIES_PER_HOUR 100
    PASSWORD EXPIRE INTERVAL 180 DAY
    FAILED_LOGIN_ATTEMPTS 3
    ATTRIBUTE '{"fname": "James", "lname": "Pretty"}';

GRANT select on orders to "test"

SELECT * FROM INFORMATION_SCHEMA.USER_ATTRIBUTES WHERE USER='test';

### Результат:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/attribute.PNG?raw=true "Optional Title")

## Задача 3:
### SQL запросы:

show create table orders

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/engine.PNG?raw=true "Optional Title")

### Меняем движок в таблицах:

ALTER TABLE orders ENGINE = InnoDB;
ALTER TABLE orders ENGINE = MyISAM;

### MyISAM:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/maisam.PNG?raw=true "Optional Title")

### InnoDB:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/innodb.PNG?raw=true "Optional Title")

## Задача 4:
### my.cnf:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.3/config.PNG?raw=true "Optional Title")
