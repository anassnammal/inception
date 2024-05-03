#!/bin/bash

STEPS=(
    "mkdir -p /etc/nginx/ssl"
    "openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout //etc/nginx/ssl/inception.key -subj \"/C=MA/ST=Khouribga/L=Khouribga/O=42/OU=1337kh/CN=me.42.fr/UID=anammal\""
    "mkdir -p /var/run/nginx"
    "chmod 0755 /var/www/wordpress"
    "chown -R www-data:www-data /var/www/wordpress"
)

for step in "${STEPS[@]}"
do
    eval $step
    if [[ $? -ne 0 ]]; then
        exit $?
    fi
done

rm -rf $0