#!/usr/bin/env bash
# we run this script the first time to configure the app 
# and populate our ojs db
# after that, we touch a blank file to ensure we don't do it again
# on subsequent reload commands
if [[ ! -f /vagrant/ojs_installed ]]; then
	echo "creating config file"
	cp /vagrant/config.TEMPLATE.inc.php /vagrant/config.inc.php
	sed -i 's/installed = Off/installed = On/g' /vagrant/config.inc.php
	sed -i 's/username = ojs/username = root/g' /vagrant/config.inc.php
	sed -i 's/password = ojs/password = /g' /vagrant/config.inc.php
	
	echo "Creating and populating SQL database..."
	mysql -u root -e 'CREATE DATABASE IF NOT EXISTS ojs;' 
	
	echo "Loading sql dump..."
	gunzip -f /vagrant/ojs.sql.gz
	mysql -u root ojs < /vagrant/ojs.sql
	touch /vagrant/ojs_installed
fi