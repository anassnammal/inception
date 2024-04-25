# syntax=docker/dockerfile:1

FROM debian:stable-slim

WORKDIR /data/www

RUN apt-get update && apt-get -y install nginx

CMD [ "nginx" ]

