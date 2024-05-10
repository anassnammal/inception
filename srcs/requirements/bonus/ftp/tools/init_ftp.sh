# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_ftp.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anammal <anammal@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/10 16:14:11 by anammal           #+#    #+#              #
#    Updated: 2024/05/10 21:41:05 by anammal          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# exit imediately if a command exits with a non-zero status
set -e

echo $FTP_USER
echo $FTP_PASSWORD

# create ftp group
addgroup ftpgroup

# create ftp user belonging to ftp group
useradd -g ftpgroup -d /var/www/wordpress -s /sbin/nologin $FTP_USER

# set password for ftp user
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

# change ownership of the wordpress directory
chown -R $FTP_USER:ftpgroup /var/www/wordpress

# change permissions of the wordpress directory
chmod -R 775 /var/www/wordpress

# create vsftpd runtime directory
mkdir -p /var/run/vsftpd/empty

# start vsftpd
vsftpd /etc/vsftpd.conf