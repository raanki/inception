#!/bin/bash

set -e

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=KR/ST=Seoul/L=Seoul/O=${WP_TITLE}/CN=${WP_URL}";
fi

exec nginx -g 'daemon off;'