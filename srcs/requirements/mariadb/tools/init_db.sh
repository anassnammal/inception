# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_db.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anammal <anammal@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/08 17:34:22 by anammal           #+#    #+#              #
#    Updated: 2024/05/08 18:53:30 by anammal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


####### This script is used to initialize and configure the mariadb server #######

# Exit immediately if a command exits with a non-zero status
set -e

# start the mariadb service
service mariadb start

# arbitrary sleep to wait for the mariadb service to start
echo "Waiting for the mariadb service to be fully ready..."
sleep 5

# check if the database is already initialized
if [ -f /var/lib/mysql/initialized ]; then
    echo "Database is already initialized"
    exit 0
fi

## this part is a set of SQL commands passed to db via "mysql -e" command

# create the database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# create the user
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# grant all privileges to the newly created user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# set the root password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# flush privileges to apply changes
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# shutdown the mariadb service
mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown