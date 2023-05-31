FROM debian:buster

RUN apt update && apt install -y \
    vim less

RUN apt install -y \
    vsftpd


RUN mkdir -p /var/run/vsftpd/empty

COPY conf/vsftpd.conf .
COPY tools/entrypoint.bash .

ENTRYPOINT [ "bash", "entrypoint.bash" ]

# CMD [ "vsftpd", "/vsftpd.conf" ]