## Задача 1
### Docker compose file:

![docker](docker.PNG)

### Статус БД \s :

![info](info.PNG)

### Колличество записей price > 300:

![price](price.PNG)

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

![attribute](attribute.PNG)

## Задача 3:
### SQL запросы:

show create table orders

![engine](engine.PNG)

### Меняем движок в таблицах:

ALTER TABLE orders ENGINE = InnoDB;
ALTER TABLE orders ENGINE = MyISAM;

### MyISAM:

![myisam](myisam.PNG)

### InnoDB:

![innodb](innodb.PNG)

## Задача 4:
### my.cnf:

![config](config.PNG)
