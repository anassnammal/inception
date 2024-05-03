#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

COPY tools/init_wp.sh .
COPY conf/wp-fpm.conf .

RUN bash init_wp.sh

CMD [ "php-fpm", "-F", "-O"]