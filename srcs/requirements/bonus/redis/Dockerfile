#syntax=docker/dockerfile:1

FROM debian:oldstable-slim

RUN apt-get update && apt-get install -y redis-server && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY tools/init_redis.sh /init_redis.sh

CMD ["bash", "init_redis.sh"]