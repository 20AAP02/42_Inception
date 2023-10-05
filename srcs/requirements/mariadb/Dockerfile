# This Dockerfile builds an image based on Alpine Linux 3.17,
# installs MariaDB and its client, modifies MariaDB configuration 
# to allow network access, copies a setup script into the image, 
# and sets that script as the entry point for the container.

FROM alpine:3.17

RUN apk update \
	&& apk add mariadb \
	mariadb-client

# ---------------------------------- mariadb --------------------------------- #

# Replaces a commented-out line in the MariaDB configuration file 
# to allow binding to the address 0.0.0.0, which means it will 
# listen on all available network interfaces.
RUN sed -ie "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf \

# Comments out a line that would otherwise disable networking 
# in MariaDB by prefixing it with #.
RUN sed -ie "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf

COPY setup.sh .

ENTRYPOINT ["./setup.sh"]
