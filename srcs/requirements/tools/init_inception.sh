#!/bin/bash

# This script is used to initialize the project by creating the necessary files and directories

# Exit immediately if a command exits with a non-zero status
set -e

# Generate .env file with the necessary variables for the project
gen_env() {
    local ENV_PATH=$1
    local DOMAIN_NAME="$USER.42.fr"
    local CERT_PATH="/etc/nginx/ssl"

    echo "# NGINX SETUP" >> $ENV_PATH
    echo "DOMAIN_NAME=$DOMAIN_NAME" >> $ENV_PATH
    echo "CERT_PATH=$CERT_PATH" >> $ENV_PATH
    echo "CERT=$DOMAIN_NAME.crt" >> $ENV_PATH
    echo "CERT_KEY=$DOMAIN_NAME.key" >> $ENV_PATH
    echo "# MYSQL SETUP" >> $ENV_PATH
    read -p "Enter your mysql database name: " MYSQL_DATABASE && echo "MYSQL_DATABASE=$MYSQL_DATABASE" >> $ENV_PATH
    read -p "Enter your mysql root password: " MYSQL_ROOT_PASSWORD && echo "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD" >> $ENV_PATH
    read -p "Enter your mysql user name: " MYSQL_USER && echo "MYSQL_USER=$MYSQL_USER" >> $ENV_PATH
    read -p "Enter your mysql user password: " MYSQL_PASSWORD && echo "MYSQL_PASSWORD=$MYSQL_PASSWORD" >> $ENV_PATH
    echo "# WORDPRESS SETUP" >> $ENV_PATH
    read -p "Enter your wordpress title: " WP_TITLE && echo "WP_TITLE=$WP_TITLE" >> $ENV_PATH
    read -p "Enter your wordpress admin name: " WP_ADMIN && echo "WP_ADMIN=$WP_ADMIN" >> $ENV_PATH
    read -p "Enter your wordpress admin email: " WP_ADMIN_EMAIL && echo "WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL" >> $ENV_PATH
    read -p "Enter your wordpress admin password: " WP_ADMIN_PASSWORD && echo "WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD" >> $ENV_PATH
    read -p "Enter your wordpress user name: " WP_USER && echo "WP_USER=$WP_USER" >> $ENV_PATH
    read -p "Enter your wordpress user email: " WP_USER_EMAIL && echo "WP_USER_EMAIL=$WP_USER_EMAIL" >> $ENV_PATH
    read -p "Enter your wordpress user password: " WP_USER_PASSWORD && echo "WP_USER_PASSWORD=$WP_USER_PASSWORD" >> $ENV_PATH
}

# Check if the .env file exists, if not, generate it
ENV_PATH=$(pwd)/srcs/.env
if [ ! -f $ENV_PATH ]; then
    gen_env $ENV_PATH
fi

# Check if the certificate exists, if not, generate it
CERT_PATH=$(pwd)/srcs/requirements/nginx/conf
DOMAIN_NAME=$(grep -m 1 "DOMAIN_NAME" $ENV_PATH | cut -d '=' -f2)
if [ ! -f "$CERT_PATH/$DOMAIN_NAME.crt" ]; then

    openssl req -x509 -nodes -out $CERT_PATH/$DOMAIN_NAME.crt \
    --keyout $CERT_PATH/$DOMAIN_NAME.key \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=42/OU=1337kh/CN=$DOMAIN_NAME/UID=$USER"
    echo "Certificate for $DOMAIN_NAME created"

else

    echo "Certificate already exists"

fi

# Create the necessary directories for the project (for docker volumes)
mkdir -p $HOME/data/wordpress
mkdir -p $HOME/data/mariadb

