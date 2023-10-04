FROM alpine:3.17

RUN apk update \
	&& apk add wget

# ------------------------------------ php ----------------------------------- #
RUN apk add --no-cache \
	php8 \
	php8-fpm \
	php8-json \
	php8-mbstring \
	php8-mysqli \
	php8-phar \
	php8-tokenizer \
	php8-openssl \
	php-curl \
	mariadb-client

# php-fpm configuration
COPY www.conf /etc/php7/php-fpm.d/www.conf

# deamonize php-fpm
RUN sed -ie 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf

# setup user www-data
RUN adduser -S www-data

# --------------------------------- wordpress -------------------------------- #
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY setup.sh .

ENTRYPOINT ["./setup.sh"]
