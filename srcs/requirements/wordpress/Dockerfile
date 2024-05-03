#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

RUN apt-get update && apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY tools/init_wp.sh .

COPY conf/wp-fpm.conf .

COPY conf/wp-config.php .

RUN bash init_wp.sh

CMD [ "php-fpm7.4", "-F", "-O"]