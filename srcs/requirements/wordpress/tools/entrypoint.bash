#!/bin/bash

if [ ! -d /var/www/html ]; then
  echo "Le dossier html n'existe pas"
  
  cd /var/www/
  rm -rf * && rm -rf .*
  
  sudo -u www-data mkdir html
  cd html
  sudo -u www-data -- wp core download

  sudo -u www-data -- wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O adminer.php
  sudo -u www-data -- wget https://raw.githubusercontent.com/lukashron/adminer-dark-theme/master/dist/adminer.css -O adminer.css
  
else
  echo "Le dossier html existe"
fi

cd /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then

  sudo -u www-data -- \
      wp config create \
          --dbname=${DB_NAME} \
          --dbuser=${DB_USER} \
          --dbpass=${DB_PASSWORD} \
          --dbhost=mariadb \
          --dbprefix=wp_
fi

until [ -f /shared/mariadb_ready ]; do
  echo "En attente du semaphore..."
  sleep 1
done

until mysqladmin ping -h mariadb -u ${DB_USER} -p${DB_PASSWORD} --silent; do
  echo "En attente de MariaDB..."
  sleep 1
done

sudo -u www-data -- \
    wp core install \
        --url='kisikaya.42.fr' \
        --title='Cuicui Kaya' \
        --admin_user=${WORDPRESS_USERNAME} \
        --admin_password=${WORDPRESS_PASSWORD} \
        --admin_email=${WORDPRESS_EMAIL}


if ! grep -q 'WP_REDIS_HOST' /var/www/html/wp-config.php; then
  sed -i "1a define('WP_REDIS_HOST', 'redis');" /var/www/html/wp-config.php
  sudo -u www-data -- wp plugin install redis-cache --activate
  sudo -u www-data -- wp redis enable
fi





exec php-fpm7.3 -F
