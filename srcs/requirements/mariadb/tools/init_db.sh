#!/bin/bash

STEPS=(
    "service mysql start"
    "mysql -e \"CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;\""
    "mysql -e \"CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';\""
    "mysql -e \"GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';\""
    "mysql -e \"FLUSH PRIVILEGES;\""
    "mysqladmin -u root -p ${SQL_ROOT_PASSWORD} shutdown"
)

for step in ${STEPS[@]}
do
    eval $step
    if [[ $? -ne 0 ]]; then
        exit $?
    fi
done

rm -rf $0
