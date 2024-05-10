#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

RUN apt-get update && apt-get install -y vsftpd && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/init_ftp.sh /init_ftp.sh

CMD ["bash", "init_ftp.sh"]