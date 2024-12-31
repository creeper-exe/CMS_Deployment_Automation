#!/bin/bash

if [ ! -f ${CERTS_} ]; then
echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ${CERTS2_} -out ${CERTS_} -subj "/C=$COUNTRY/ST=$STATE/L=$LOCAL_/O=$ORGANIZATION/CN=$DOMAIN_NAME";

echo "Nginx: ssl is set up!";
fi

exec "$@"
