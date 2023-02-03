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