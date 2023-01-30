#!/bin/bash




PROTECT_FILE="/etc/mysql/.mysql_protect"

# Protection for first launch
if [ ! -f "$PROTECT_FILE" ]; then
	< /etc/mysql/sqlCMD.sql envsubst > /etc/mysql/sqlCMD_new.sql
	service mysql start;
	mysql < /etc/mysql/sqlCMD_new.sql
	service mysql stop;


	touch "$PROTECT_FILE"
fi

# Start DB
exec mysqld_safe





# Check if the /var/lib/mysql/wordpress_data directory exists
#if [ ! -d "/var/lib/mysql/wordpress_data" ]; then
#    service mysql start
#
#    # sleep 3
#    touch file_tmp
#
#    chmod 777 file_tmp
#    cat  << END > file_tmp
#CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
#CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
#GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';
#ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
#FLUSH PRIVILEGES;
#END
#mysqld < file_tmp
#
#service mysql stop
#exec mysqld --user=mysql --bind_address=0.0.0.0







#SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');

#     mysql -u root <<END
# CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
# CREATE USER IF NOT EXISTS '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'localhost';
# SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');
# FLUSH PRIVILEGES;
# END

    #service mysql stop
    #systemctl stop mariadb
    #mysqld_safe --skip-grant-tables &
    #mysql -u root -p $SQL_ROOT_PASSWORD -e "UPDATE mysql.user SET authentication_string=PASSWORD('$SQL_ROOT_PASSWORD'), password_expired='N' WHERE User='root' AND Host='localhost';"
    #mysql -u root -p $SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

    # sleep 3
#fi

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