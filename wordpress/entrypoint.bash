#!/bin/bash

# until mysql -h mariadb -u ${DB_USER} -p${DB_PASSWORD} -e 'select 1'; do
#   echo "En attente de MariaDB..."
#   sleep 1
# done

until [ -f /shared/mariadb_ready ]; do
  echo "En attente du semaphore..."
  sleep 1
done

until mysqladmin ping -h mariadb -u ${DB_USER} -p${DB_PASSWORD} --silent; do
  echo "En attente de MariaDB..."
  sleep 1
done


cd /var/www/html

sudo -u www-data -- \
    wp config create \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASSWORD} \
        --dbhost=mariadb \
        --dbprefix=wp_

sudo -u www-data -- \
    wp core install \
        --url='kisikaya.42.fr' \
        --title='Cuicui Kaya' \
        --admin_user=${WORDPRESS_USERNAME} \
        --admin_password=${WORDPRESS_PASSWORD} \
        --admin_email=${WORDPRESS_EMAIL}


exec php-fpm7.3 -F
