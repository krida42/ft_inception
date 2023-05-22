#!/bin/bash

service php7.3-fpm start

cd /var/www/html

rm -rf *

wget https://wordpress.org/latest.tar.gz

tar -xzf latest.tar.gz

rm latest.tar.gz

mv wordpress/* .


tail -f /dev/null
