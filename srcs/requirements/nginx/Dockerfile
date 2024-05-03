#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

RUN apt-get update && apt-get install nginx openssl -y  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY tools/init_nginx.sh .

RUN bash init_nginx.sh

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx"]