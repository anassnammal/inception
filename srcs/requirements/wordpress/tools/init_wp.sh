#!/bin/bash

STEPS=(
    "apt-get update && apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*"
    "wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www/"
    "tar -xvf /var/www/wordpress-6.5-fr_FR.tar.gz -C /var/www/"
    "rm /var/www/wordpress-6.5-fr_FR.tar.gz"
    "useradd -m -d /var/www/wordpress -s /bin/bash wp-user"
    "chown -R wp-user:wp-user /var/www/wordpress"
    "mv wp-fpm.conf /etc/php/7.4/fpm/pool.d/www.conf"
    "systemctl restart php7.4-fpm"
    "mv wp-config.php /var/www/wordpress/wp-config.php"
)

for step in "${STEPS[@]}"
do
    eval $step
    if [[ $? -ne 0 ]]; then
        exit $?
    fi
done

rm -rf $0