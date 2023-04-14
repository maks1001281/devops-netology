## Краткое описание инцидента
#### 21 октября 2018года в 22:52 внутренние системы платформы GitHub функционировали в нештатном режиме, что привело к отображению неактуальной информации. Возникла несогласованность данных в БД

## Предшествующие события
#### Были плановые работы по замене оптического модуля, связь между ЦОД была потеряна на 43 секунды

## Причина инцидента
#### Потеря соединения с ЦОД  привела к рассогласованности кластеров MySQL.

## Воздействие
#### Несогласованность предоставляемой информации

## Обнаружение
#### Инцидент замечен дежурными инженерами и  передан ответственным по комканде

## Реакция
#### Деградация сервиса в течении 24 часов и 11 минут.

## Восстановление
#### Полное восстановление было произведено с самой актуальной БД и последующей ее репликацией в другие БД