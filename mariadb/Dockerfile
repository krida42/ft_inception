FROM	debian:buster


RUN	apt update && apt install -y \
	vim

RUN	apt install -y \
	mariadb-server

RUN mkdir /shared

COPY	entrypoint.bash .


ENTRYPOINT ["bash", "entrypoint.bash"]

# EXPOSE 3306
