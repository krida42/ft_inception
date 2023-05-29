FROM	debian:buster


RUN	apt update && apt install -y \
	vim

RUN	apt install -y \
	nginx php-fpm openssl

RUN mkdir -p /etc/nginx/ssl

RUN		openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-subj "/C=FR/ST=ILE-DE-FRANCE/L=Paris/O=42/OU=kisikaya/CN=kisikaya.42.fr" \
		-keyout /etc/nginx/ssl/selfsigned.key \
		-out /etc/nginx/ssl/selfsigned.crt

COPY	tools/entrypoint.bash .

COPY	conf/default /etc/nginx/sites-available


EXPOSE 443
EXPOSE 80


ENTRYPOINT ["bash", "entrypoint.bash"]
