
1.	Задача 1

Используя docker поднимите инстанс MySQL (версию 8). Данные БД сохраните в volume.
Изучите бэкап БД и восстановитесь из него.
Перейдите в управляющую консоль mysql внутри контейнера.
Используя команду \h получите список управляющих команд.
Найдите команду для выдачи статуса БД и приведите в ответе из ее вывода версию сервера БД.
Подключитесь к восстановленной БД и получите список таблиц из этой БД.
Приведите в ответе количество записей с price > 300.
В следующих заданиях мы будем продолжать работу с данным контейнером.
Решение:

1.1)	Подготовим docker-манифест
Netology_6_2_SQL$ sudo docker ps
version: '3.7'
services:
  db:
    container_name: mysql_db
    image: mysql:8
#    restart: always
    environment:
      MYSQL_DATABASE: my_db_mysql
      MYSQL_USER: bantserev
      MYSQL_PASSWORD: qwerty
      MYSQL_ROOT_PASSWORD: qwerty
    volumes:
      - my_db_vol:/var/lib/mysql

volumes:
  my_db_vol:


1.2)	Проверим, как заходим в контейнер
artem@ubuntu:~/Netology_6_3_MySQL$ sudo docker exec -it mysql_db bash

и посмотрим на окружение:

bash-4.4# printenv
MYSQL_PASSWORD=qwerty
HOSTNAME=8a7d0f9f3286
MYSQL_DATABASE=my_db_mysql
MYSQL_ROOT_PASSWORD=qwerty
PWD=/
HOME=/root
MYSQL_MAJOR=8.0
GOSU_VERSION=1.14
MYSQL_USER=bantserev
MYSQL_VERSION=8.0.29-1.el8
affinity:container==e10a00eec96f8e88d7f0a56a1f66cdc6fb757c8379d57fdaa8631b1b95d7e7b0
TERM=xterm
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
MYSQL_SHELL_VERSION=8.0.29-1.el8
_=/usr/bin/printenv


1.3)	Скопируем файл бэкпа с гита в папку проекта:
artem@ubuntu:~/Netology_6_3_MySQL$ touch test_dump.sql
artem@ubuntu:~/Netology_6_3_MySQL$ sudo nano test_dump.sql
(https://github.com/netology-code/virt-homeworks/blob/master/06-db-03-mysql/test_data/test_dump.sql) 

1.4)	Создадим папку для бэкапа в контейнере mysql_db:
bash-4.4# mkdir backup

Скопируем бэкап в контейнер:
artem@ubuntu:~/Netology_6_3_MySQL$ sudo docker cp test_dump.sql mysql_db:/backup/test_dump.sql

Проверим, что бэкап записался в папку проекта:
