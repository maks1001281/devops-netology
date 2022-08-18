## Задача 1
### Docker-compose файл:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/compose.PNG?raw=true "Optional Title")

## Задача 2
### Итоговый список БД:
![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/base.PNG?raw=true "Optional Title")

### Описание таблицы clients:
![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/clienst.PNG?raw=true "Optional Title")

### Описание таблицы orders:
![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/orders.PNG?raw=true "Optional Title")

### SQL запрос для выдачи списка пользователей:

SELECT * FROM information_schema.table_privileges where grantee = 'test-simple-user'

### Вывод списока пользователей с правами на test_db:
![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/users.PNG?raw=true "Optional Title")

## Задача 3
### Запросы для вычисления количества записей для каждой таблицы:

SELECT count(*) FROM clients
SELECT count(*) FROM orders

### Результат выполнения:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/select.PNG?raw=true "Optional Title")

## Задача 4
### Связываем записи в таблицах:

update clients set Заказ = 3 where id = 1
update clients set Заказ = 4 where id = 2
update clients set Заказ = 5 where id = 3

### Делаем запрос:

select * from clients where Заказ != 0

### Результат:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/update.PNG?raw=true "Optional Title")

## Задача 5
### Получаем полную информацию по выполнению запроса:

explain analyse  select * from clients where Заказ != 0

### Расшифровка:

### Ccost Приблизительная стоимость запуска. Это время, которое проходит, прежде чем начнётся этап вывода данных и приблизительная общая стоимость
### Rows Ожидаемое число строк, которое должен вывести этот узел плана
### Width Ожидаемый средний размер строк, выводимых этим узлом плана
### Вывод: Чем меньше данные результаты тем быстрее и эффективнее выполняется запрос

### Результат выполнения:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/analyse.PNG?raw=true "Optional Title")

## Задача 6

### Делаем buckup текущей базы:
pg_dump -U user test_db -f /media/postgresql/backup/base

### Делаем восстановление базы:
psql -U user -W test_db < /media/postgresql/backup/base

### Проверяем backup:

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/6.2/restore.PNG?raw=true "Optional Title")
