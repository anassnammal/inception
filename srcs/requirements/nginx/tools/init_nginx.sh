#!/bin/bash

STEPS=(
    "apt-get update && apt-get install nginx openssl -y  && apt-get clean && rm -rf /var/lib/apt/lists/*"
    "mkdir -p /etc/nginx/ssl"
    "openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout //etc/nginx/ssl/inception.key -subj \"/C=MA/ST=Khouribga/L=Khouribga/O=42/OU=1337kh/CN=anammal.42.fr/UID=anammal\""
    "mkdir -p /var/run/nginx"
    "chmod 0755 /var/www/html"
    "chown -R www-data:www-data /var/www/html"
)

for step in "${STEPS[@]}"
do
    eval $step
    if [[ $? -ne 0 ]]; then
        exit $?
    fi
done