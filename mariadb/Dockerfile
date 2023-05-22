FROM	debian:buster


RUN	apt update && apt install -y \
	vim

RUN	apt install -y \
	mariadb-server


COPY	entrypoint.bash .



ENTRYPOINT ["bash", "entrypoint.bash"]
