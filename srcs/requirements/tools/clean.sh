#!/bin/bash

source ./srcs/.env

if grep "127.0.0.1	${DOMAIN}" /etc/hosts > /dev/null; then
sudo sed -i -e "/127\.0\.0\.1	${DOMAIN}/d" /etc/hosts
fi

sudo rm -Rf sudo ${VOLUME}