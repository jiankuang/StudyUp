#!/bin/bash

export REDIS_HOST=$1

while IFS= read -r LINE; do
	if [[ $LINE = "    server ${REDIS_HOST}:6379;" ]]; then
                echo "The Redis IP is the same as what already been used!"
		exit 1
        fi
done < "/etc/nginx/nginx.conf"

sed -i "s/server.*6379/server ${REDIS_HOST}:6379/" /etc/nginx/nginx.conf

/usr/sbin/nginx -s reload
