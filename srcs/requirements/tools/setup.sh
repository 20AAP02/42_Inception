#!/bin/bash

source ./srcs/.env

if ! grep "127.0.0.1	${DOMAIN}" /etc/hosts > /dev/null; then
echo "127.0.0.1	${DOMAIN}" | sudo tee -a /etc/hosts
fi

sudo mkdir -p ${VOLUME}/server
sudo mkdir -p ${VOLUME}/db