#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: ./start.sh <public-hostname>"
    echo ""
    echo "Please do not use 'localhost' as the public-hostname even for testing."
    echo "The definition of 'localhost' changes fron container to container."
    echo ""
    echo "Please use a hostname that both this server and the client can all resolve to this server, e.g. the FQDN of the current machine"
    exit 0
fi

cd gene.iobio && git reset --hard && git apply <(cat ../endpoint.diff.tmpl | sed "s/@hostname@/$1/g")
docker-compose up -d
