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

RUN mkdir -p /var/www/html \
	&& cd /var/www/html \
	&& wget https://wordpress.org/latest.tar.gz \
	&& tar -xzf latest.tar.gz \
	&& rm latest.tar.gz \
	&& mv wordpress/* .

COPY	conf/www.conf /etc/php/7.3/fpm/pool.d

COPY	entrypoint.bash .


ENTRYPOINT ["bash", "entrypoint.bash"]
