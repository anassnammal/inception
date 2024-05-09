#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

RUN apt-get update \
&& apt-get install -y php7.4 php-fpm php-mysql mariadb-client \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/wp-fpm.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/init_wp.sh /init_wp.sh

COPY tools/conf_wp.sh /var/www/wordpress/conf_wp.sh

RUN chmod +x /init_wp.sh

CMD [ "bash", "-c", "./init_wp.sh && php-fpm7.4 -F" ]
