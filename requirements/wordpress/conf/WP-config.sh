#!/bin/bash
sleep 10


# Download the latest WordPress files
#wp core download --allow-root

#sleep 3
wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi

#chmod 644 /var/www/wordpress/wp-config.php
#chmod 644 /var/www/wordpress/wp-settings.php
#chown www-data:www-data /var/www/wordpress/wp-config.php
#chown www-data:www-data /var/www/wordpress/wp-settings.php

/usr/sbin/php-fpm7.3 -F
