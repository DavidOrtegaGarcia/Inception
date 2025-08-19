#!/bin/bash

sleep 15
if [ ! -f wp-config.php ]; then
	wp core download --allow-root
	wp config create \
		--dbname=$NAME_DB --dbuser=$USER_NAME_DB \
		--dbpass=$USER_PASSWD_DB --dbhost=$HOST_NAME_DB \
		--allow-root
	wp core install \
		--url="$DOMAIN_NAME" --title="$TITLE_WP" \
		--admin_user="$ADMIN_NAME_WP" \
		--admin_password="$ADMIN_PASSWD_WP" \
		--admin_email="$ADMIN_EMAIL_WP" --skip-email \
		--allow-root
	wp user create $USER_NAME_WP $USER_EMAIL_WP --role=editor \
	       	--user_pass=$USER_PASSWD_WP --allow-root
fi

exec /usr/sbin/php-fpm8.2 -F
