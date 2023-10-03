FROM alpine:3.14

RUN apk update \
	&& apk add mariadb \
				mariadb-client

# ---------------------------------- mariadb --------------------------------- #
RUN sed -ie "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf \
	&& sed -ie "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf

COPY setup.sh .

ENTRYPOINT ["./setup.sh"]
