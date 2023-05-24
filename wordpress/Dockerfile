FROM	debian:buster

RUN	apt update && apt install -y \
	vim

RUN	apt install -y \
	php-fpm

RUN apt install -y \
	php-curl php-dom php-exif \
	php-fileinfo php-json \
	php-mbstring php-mysqli \
	php-gd php-xml php-zip wget

# RUN mkdir -p /var/www/html \
# 	&& wget https://wordpress.org/latest.tar.gz \
# 	&& tar -xzf latest.tar.gz \
# 	&& rm latest.tar.gz \
# 	&& mv wordpress/* /var/www/html \
# 	&& rm -rf wordpress

RUN mkdir -p /var/www/html \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d

# COPY	conf/wp-config.php /var/www/html

COPY	entrypoint.bash .


ENTRYPOINT ["bash", "entrypoint.bash"]
