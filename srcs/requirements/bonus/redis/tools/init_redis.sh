# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_redis.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anammal <anammal@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/10 14:33:06 by anammal           #+#    #+#              #
#    Updated: 2024/05/10 15:28:07 by anammal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

############## This script is used to initialize the redis server  #############

# exit immediately if a command exits with a non-zero status
set -e

# set redis password in the redis configuration file
echo "requirepass $REDIS_PASSWORD" >> /etc/redis.conf

# start redis server with the new configuration
redis-server /etc/redis.conf