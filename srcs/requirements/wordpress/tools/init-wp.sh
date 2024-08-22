#!/bin/bash

set -e

while ! mysqladmin -h$DB_HOST -u$DB_USER -p$DB_PASS ping >/dev/null 2>&1; do
  sleep 1
done

wp-cli core download --allow-root --force
wp-cli config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --force
wp-cli core install --url=$WP_URL/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

if ! wp-cli user get $WP_USER --allow-root >/dev/null 2>&1; then
    wp-cli user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=subscriber --allow-root
fi

wp-cli theme install astra --allow-root
wp-cli theme update astra --allow-root
wp-cli theme activate astra --allow-root

exec /usr/sbin/php-fpm7.4 -F
