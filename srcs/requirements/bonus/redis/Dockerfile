FROM debian:buster


RUN apt update && apt install -y \
    vim

RUN apt install -y \
    redis-server



COPY tools/entrypoint.bash .

ENTRYPOINT [ "bash", "entrypoint.bash" ]