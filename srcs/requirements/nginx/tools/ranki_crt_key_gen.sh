#!/bin/bash

# Stop si ya une erreur
set -e

# Vérifie si le certif SSL existe pas déjà
if [ ! -f /etc/ssl/certs/nginx.crt ]; then
  # Genère un certif SSL auto-signé si il existe pas
  openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=KR/ST=Seoul/L=Seoul/O=${WP_TITLE}/CN=${WP_URL}";
fi

# Lance Nginx en mode non-daemon
exec nginx -g 'daemon off;'
