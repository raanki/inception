#!/bin/sh

set -e

echo "      Connecting to db !!"
while ! mysqladmin -h$DB_HOST -u$DB_USER -p$DB_PASS ping >/dev/null 2>&1; do
  sleep 1
  echo "Still connecting ...."
done
echo "      Connected to db ~"

wp-cli core download --allow-root --force
wp-cli config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --force
wp-cli core install --url=$WP_URL/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

if ! wp-cli user get $WP_USER --allow-root >/dev/null 2>&1; then
    echo "Creating new user: $WP_USER"
    wp-cli user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=subscriber --allow-root
else
    echo "User $WP_USER already exists, skipping user creation."
fi

wp-cli theme install astra --allow-root
wp-cli theme update astra --allow-root
wp-cli theme activate astra --allow-root
echo "wp-cli job done"

exec /usr/sbin/php-fpm7.4 -F
