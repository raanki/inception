#!/bin/bash

set -e


if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
  mysql_install_db --datadir=/var/lib/mysql --auth-root-authentication-method=normal >/dev/null
  mysqld --bootstrap << EOF
USE mysql;

FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS $DB_NAME;

CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';

GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';

ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT'; 

FLUSH PRIVILEGES;

EOF
fi

exec mysqld --datadir=/var/lib/mysql