#!/bin/bash

sed -i '/^bind-address/c\bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start


mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE ${DB_NAME};"
mysql -u root -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER};"


tail -f /dev/null
