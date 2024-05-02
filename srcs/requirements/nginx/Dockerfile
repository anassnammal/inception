#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

COPY tools/init_nginx.sh .

RUN bash init_nginx.sh

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx"]