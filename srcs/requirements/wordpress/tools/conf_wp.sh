#!/bin/bash

# exit immediately if a command exits with a non-zero status
set -e

# download and install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

# create a cache directory for wp-cli
mkdir -p .wp-cli/cache

# set wp-cli cache environment variable
export WP_CLI_CACHE_DIR=$(pwd)/.wp-cli/cache

# download wordpress core files in the current directory
./wp-cli.phar core download

# create wp-config.php file
./wp-cli.phar config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb

# install wordpress and create an admin user
./wp-cli.phar core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email

# create a new user
./wp-cli.phar user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD

# install redis cache plugin
./wp-cli.phar plugin install redis-cache --activate

# configure redis cache plugin
./wp-cli.phar config set WP_REDIS_HOST redis
./wp-cli.phar config set WP_REDIS_PORT 6379
./wp-cli.phar config set WP_REDIS_PASSWORD $REDIS_PASSWORD

# enable redis cache plugin
./wp-cli.phar redis enable

# create a file to indicate that the initialization is done
touch .initialized

# remove wp-cli
rm -f wp-cli.phar

# remove this script
rm -f $0

