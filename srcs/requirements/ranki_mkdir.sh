#!/bin/bash

set -e

volume_path="/home/ranki/data"
wordpress_path="${volume_path}/wordpress"
mariadb_path="${volume_path}/mariadb"


if [ ! -d "${wordpress_path}" ]; then
    echo "Make ${wordpress_path} directory !!!"
    mkdir -p "${wordpress_path}"
fi

if [ ! -d "${mariadb_path}" ]; then
    echo "Make ${mariadb_path} directory !!!"
    mkdir -p "${mariadb_path}"
fi