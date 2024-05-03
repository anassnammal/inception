#!/bin/bash

STEPS=(
    "wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www/"
    "tar -xvf /var/www/wordpress-6.5-fr_FR.tar.gz -C /var/www/"
    "rm /var/www/wordpress-6.5-fr_FR.tar.gz"
    "useradd -m -d /var/www/wordpress -s /bin/bash wp-user"
    "chown -R wp-user:wp-user /var/www/wordpress"
    "mv wp-fpm.conf /etc/php/7.4/fpm/pool.d/www.conf"
    "mkdir -p /run/php/"
    "chown -R wp-user:wp-user /run/php/"
    "mv wp-config.php /var/www/wordpress/wp-config.php"
    "chown -R wp-user:wp-user /var/www/wordpress/wp-config.php"
    "systemctl restart php7.4-fpm"
)

for step in "${STEPS[@]}"
do
    eval $step
    if [[ $? -ne 0 ]]; then
        exit $?
    fi
done

rm -rf $0