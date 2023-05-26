#!/bin/bash

sed -i '/^bind-address/c\bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe &

until mysqladmin ping --silent; do
  echo "En attente de MariaDB..."
  sleep 1
done


# mysqladmin -u root password ${DB_ROOT_PASSWORD}

mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE ${DB_NAME};"
mysql -u root -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER};"

mysqladmin -p${DB_ROOT_PASSWORD} shutdown

touch /shared/mariadb_ready

exec mysqld_safe

