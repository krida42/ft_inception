FROM debian:buster

RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g --unsafe-perm node-red

RUN mkdir -p /var/nodered/data/

EXPOSE 1880


CMD ["node-red", "--userDir", "/var/nodered/data"]

