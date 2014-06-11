#!/usr/bin/env bash
# This script installs apache, mysql server and php
# Together with some common php modules
# In addition it moves the Apache DocumentRoot
# so that files will be served from the /vagrant shared folder
echo "Installing apache, mysql and php..."
yum -y install httpd mysql-server php php-mysql php-xml

echo "moving Apache DocumentRoot to Vagrant mount"
sed -i 's/DocumentRoot "\/var\/www\/html"/DocumentRoot "\/vagrant"/g' /etc/httpd/conf/httpd.conf

echo "exposing mysql server to host machine"
sed -i 's/symbolic-links=0/symbolic-links=0\nbind-address=0.0.0.0/g' /etc/my.cnf

echo "configuring php for development mode"
cp /usr/share/doc/php-common-*/php.ini-production /etc/php.ini
sed -i 's/;date.timezone =/date.timezone = Europe\/Copenhagen/g' /etc/php.ini

echo "Ensure apache and mysql start on startup"
chkconfig httpd on
chkconfig mysqld on

echo "Start apache and mysql servers"
service httpd start
service mysqld start

echo "enable external access to MySQL DB"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"