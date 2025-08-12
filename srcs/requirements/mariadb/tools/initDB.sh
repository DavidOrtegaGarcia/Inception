#!/bin/bash

#Give permision to bind mount
chown -R mysql:mysql /var/lib/mysql
chmod -R 775 /var/lib/mysql

#Make socket directory with the right permissions 
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chmod -R 775 /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
    #Initialitzation the mariadb server on Bind Mount
    mariadb-install-db --user=mysql --datadir="/var/lib/mysql"
   
    #Run mariabd as daemon
    mysqld_safe --datadir="/var/lib/mysql" &
    sleep 10
   
    #Create DB and user
    mysql -e "CREATE DATABASE IF NOT EXISTS ${NAME_DB};"
    mysql -e "CREATE USER IF NOT EXISTS '${USER_NAME_DB}'@'%' IDENTIFIED BY '${USER_PASSWD_DB}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${NAME_DB}.* TO '${USER_NAME_DB}'@'%';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWD_DB}';"

    #Stop mariadb daemon
    mysqladmin -u root -p"${ROOT_PASSWD_DB}" shutdown
fi

#Remove residual sockets to prevent posssible errors
rm -f /var/run/mysqld/mysqld.sock

#Run mariadb service as main process
exec mariadbd --user=mysql --datadir="/var/lib/mysql"
