FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/script.sh /var/www

RUN chmod +x /var/www/script.sh

ENTRYPOINT [ "var/www/script.sh" ]

CMD ["nginx", "-g", "daemon off;"]