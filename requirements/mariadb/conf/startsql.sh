#!/bin/bash

# Start the MySQL service
service mysql start;

mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

if mysql -u root -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user='root' and host='localhost')" | grep -q 1; then

    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"
    mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe