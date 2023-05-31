useradd -m ftpuser && usermod -aG www-data ftpuser
echo "ftpuser:${FTP_PASSWORD}" | chpasswd

exec vsftpd /vsftpd.conf