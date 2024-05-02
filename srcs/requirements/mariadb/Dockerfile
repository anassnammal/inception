#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

COPY tools/init_db.sh /init_db.sh

RUN bash init_db.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["exec", "mysqld_safe"]