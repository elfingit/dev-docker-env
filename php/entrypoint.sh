#!/bin/bash
if ! [ -e /srv/www/.env ]; then
    echo >&2 "Laravel not found in $PWD - copying now..."
    tar --create \
			--file - \
			--one-file-system \
			--directory /root/tmp/app \
			--owner "$user" --group "$group" \
			. | tar --extract --file -
fi


php-fpm
