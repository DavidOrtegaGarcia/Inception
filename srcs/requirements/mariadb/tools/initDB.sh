#!/bin/bash

service mariadb start

if [ ! -d /var/lib/mysql/${NAME_DB} ]; then
    mysql -e "CREATE DATABASE ${NAME_DB};"
    mysql -e "CREATE USER '${USER_NAME_DB}'@'%' IDENTIFIED BY '${USER_PASSWD_DB}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${NAME_DB}.* TO '${USER_NAME_DB}'@'%';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWD_DB}';"
fi

mysqladmin -u root -p"${ROOT_PASSWD_DB}" shutdown
mysqld -u root
