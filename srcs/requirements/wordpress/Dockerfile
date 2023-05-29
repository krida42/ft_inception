FROM	debian:buster

RUN	apt update && apt install -y \
	vim

RUN	apt install -y \
	sudo mariadb-client php-fpm

RUN apt install -y \
	php-curl php-dom php-exif \
	php-fileinfo php-json \
	php-mbstring php-mysqli \
	php-gd php-xml php-zip wget


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir /var/www \
	&& chown -R www-data:www-data /var/www

RUN mkdir -p /run/php/php7.3-fpm && mkdir /shared

RUN sed -i '/^listen = /c\listen = 9000' /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/entrypoint.bash .


ENTRYPOINT ["bash", "entrypoint.bash"]

# EXPOSE 9000
