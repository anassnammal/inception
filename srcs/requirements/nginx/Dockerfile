#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

RUN apt-get update && apt-get install nginx -y  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./conf /conf

COPY tools/init_nginx.sh .

RUN chmod +x init_nginx.sh

CMD ["bash", "-c", "./init_nginx.sh && nginx"]