# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_wp.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anammal <anammal@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/09 12:55:47 by anammal           #+#    #+#              #
#    Updated: 2024/05/09 21:19:11 by anammal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#### This script is used to initialize and configure php-fpm and wordpress  ####

# exit immediately if a command exits with a non-zero status
set -e

# update a directive based on the key in a file or append it if it doesn't exist
update_or_append() {

    local file=$1
    local key=$2
    local replacement=$3

    if grep -qxF "$key" "$file"; then
        sed -i "s/^$key.*/$replacement/" "$file"
    else
        echo "$replacement" >> "$file"
    fi
    
}

update_or_append '/etc/php/7.4/fpm/php.ini' 'clear_env' 'clear_env = no'
update_or_append '/etc/php/7.4/fpm/php.ini' 'display_errors' 'display_errors = On'
update_or_append '/etc/php/7.4/fpm/php.ini' 'error_reporting' 'error_reporting = E_ALL'

# create php runtime directory
mkdir -p /run/php/

# restart php-fpm service to apply changes
service php7.4-fpm stop

# check if wordpress is already installed
if [ -f /var/www/wordpress/.initialized ]; then
    echo "Wordpress up and running... 🚀"
    exit 0
fi

# change the owner of the wordpress directory to www-data
chown -R www-data:www-data /var/www/wordpress

# addjust the permissions of the wordpress files
find /var/www/wordpress -type d -exec chmod 755 {} \;
find /var/www/wordpress -type f -exec chmod 644 {} \;

# install curl
apt-get update 1>/dev/null && apt-get install -y curl 1>/dev/null && apt-get clean 1>/dev/null && rm -rf /var/lib/apt/lists/*

# run in a new shell the initialization script as the www-data user in specific directory
su -s /bin/bash -c "cd /var/www/wordpress && bash conf_wp.sh" www-data

# remove curl
apt-get remove --purge -y curl 1>/dev/null && apt-get autoremove -y 1>/dev/null

echo "Wordpress has been successfully installed"
echo "Wordpress is up and running... 🚀"