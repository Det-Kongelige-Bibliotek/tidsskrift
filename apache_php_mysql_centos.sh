#!/usr/bin/env bash
# This script installs apache, mysql server and php
# Together with some common php modules
# In addition it moves the Apache DocumentRoot
# so that files will be served from the /vagrant shared folder
echo "Installing apache, mysql and php..."
yum -y install httpd mysql-server php php-mysql php-xml

echo "moving Apache DocumentRoot to Vagrant mount"
sed -i 's/DocumentRoot "\/var\/www\/html"/DocumentRoot "\/vagrant"/g' /etc/httpd/conf/httpd.conf

echo "Ensure apache and mysql start on startup"
chkconfig httpd on
chkconfig mysqld on

echo "Start apache and mysql servers"
service httpd start
service mysqld start