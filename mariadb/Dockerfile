FROM	debian:buster


RUN	apt update && apt install -y \
	vim

RUN	apt install -y \
	mariadb-server mariadb-client


COPY	entrypoint.bash .



ENTRYPOINT ["bash", "entrypoint.bash"]
