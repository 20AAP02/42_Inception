FROM alpine:3.17

RUN apk update \
	&& apk add wget

# Install packages not yet updated for the current alpine version TODO remove when no longer needed
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.14/community' >> /etc/apk/repositories
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.14/main' >> /etc/apk/repositories
RUN apk add --no-cache wkhtmltopdf

# ------------------------------------ php ----------------------------------- #
RUN apk add --no-cache php7 \
	php7-fpm \
	php7-json \
	php7-mbstring \
	php7-mysqli \
	php7-phar \
	php7-tokenizer \
	php7-openssl \
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
