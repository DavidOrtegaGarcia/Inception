#!/bin/bash

key="/etc/ssl/private/daortega.key"
cert="/etc/ssl/certs/daortega.crt"

if [ ! -f $cert ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout $key -out $cert \
		-subj "/C=ES/ST=BCN/L=BCN/O=42/OU=CC/CN=daortega.42.fr"
fi

exec "$@";
