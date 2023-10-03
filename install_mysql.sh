#!/bin/bash

new_mysql_user="new_user_name"
new_mysql_user_password="new_user_password"
new_databese_name="new_databese_name"

# Check if the script is running with root privileges
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run with root privileges."
  exit 1
fi

dnf update
dnf install mysql-server
echo "bind-address = 0.0.0.0" >> /etc/my.cnf
systemctl start mysqld
systemctl enable mysqld
firewall-cmd --add-service=mysql --permanent
firewall-cmd --reload
mysql_secure_installation
mysql -u root -p -e "CREATE DATABASE $new_databese_name; CREATE USER '$new_mysql_user'@'%' IDENTIFIED BY '$new_mysql_user_password'; GRANT ALL PRIVILEGES ON $new_databese_name.* TO 'new_mysql_user'@'%'; FLUSH PRIVILEGES; SHOW DATABASES;
