FROM	debian:buster


RUN	apt update && apt install -y \
	vim

RUN	apt install -y \
	mariadb-server

RUN mkdir /shared

RUN sed -i '/^bind-address/c\bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	entrypoint.bash .


ENTRYPOINT ["bash", "entrypoint.bash"]

# EXPOSE 3306
