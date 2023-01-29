#!/bin/bash

# Check if the /var/lib/mysql/wordpress_data directory exists
if [ ! -d "/var/lib/mysql/wordpress_data" ]; then
    service mysql start

    sleep 3

    mysql -u root <<END
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');
FLUSH PRIVILEGES;
END

    service mysql stop

    sleep 3
fi

mysqld_safe

#if mysql -u root -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user='root' and host='localhost')" | grep -q 1; then
#    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#fi
#
#mysql -u root -p<<EOF
#
#CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
#
#CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
#GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
#FLUSH PRIVILEGES;
#
#EOF
#
#
#mysqladmin -u root -p ${SQL_ROOT_PASSWORD} shutdown
#exec mysqld_safe