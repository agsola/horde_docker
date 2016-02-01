#!/bin/bash

#set -e

# TODO: migrate database

# copy htdocs to volume
if [ ! -e /var/www/html/index.php -o "$HORDE_UPGRADE" = "true" ]; then
    tar cf - --one-file-system -C /usr/src/horde . | tar xf -
fi
chown -R www-data.www-data .

# check and enable default config
if [ ! -e config/conf.php ]; then
    cp config/conf.php.dist config/conf.php
fi

exec "$@"
