# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_nginx.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anammal <anammal@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/08 17:25:05 by anammal           #+#    #+#              #
#    Updated: 2024/05/08 17:28:34 by anammal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


####### This script is used to initialize and configure the nginx server #######


# Exit immediately if a command exits with a non-zero status
set -e

# replace the palceholders in the nginx configuration file
sed -i "s#--server_name--#${DOMAIN_NAME}#g" /conf/nginx.conf
sed -i "s#--ssl_certificate--#$CERT_PATH/$CERT#g" /conf/nginx.conf
sed -i "s#--ssl_certificate_key--#$CERT_PATH/$CERT_KEY#g" /conf/nginx.conf

# move the configuration file to the right place
mv /conf/nginx.conf /etc/nginx/nginx.conf

# create the directory for the certificate and the key
mkdir -p ${CERT_PATH}


# move the certificate and the key to the right place
mv /conf/$CERT $CERT_PATH/$CERT
mv /conf/$CERT_KEY $CERT_PATH/$CERT_KEY

# remove the empty conf directory
rm -rf /conf

# create nginx runtime directory
mkdir -p /var/run/nginx

# set the appropriate permissions for nginx
chmod 0755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
