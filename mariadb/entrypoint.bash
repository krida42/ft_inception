#!/bin/bash

sed -i '/^bind-address/c\bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -e "CREATE USER kisikaya@'%' IDENTIFIED BY 'toor';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO kisikaya@'%';"

tail -f /dev/null
