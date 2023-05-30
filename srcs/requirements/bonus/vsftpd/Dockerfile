FROM debian:buster

RUN apt update && apt install -y \
    vim less

RUN apt install -y \
    vsftpd

RUN useradd -m ftpuser && usermod -aG www-data ftpuser \
    && echo "ftpuser:pass" | chpasswd


RUN mkdir -p /var/run/vsftpd/empty

COPY conf/vsftpd.conf .

CMD [ "vsftpd", "/vsftpd.conf" ]