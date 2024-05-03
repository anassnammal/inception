#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

RUN apt-get update && apt-get install -y mariadb-server && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY tools/init_db.sh /init_db.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN bash init_db.sh

CMD ["mysqld_safe"]