#!/bin/sh

# This script ensures that necessary directories are created, 
# initializes MariaDB if needed, and sets up the specified MySQL user 
# and database. Finally, it starts the MariaDB server.

# If directory doesn't exist,
# create and set ownership to the mysql user and group
if [ ! -d "/run/mysqld" ]; then

	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld

fi

# If MariaDB data directoy doesn't exist, initialize the MariaDB data directory,
# perform a bootstrap operation and set up the specified MySQL user and database.
if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then

	mysql_install_db --user=mysql --skip-test-db --basedir=/usr --datadir=/var/lib/mysql

	mysqld -u mysql --bootstrap <<EOF
		flush privileges;
		create user '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';
		create database ${MYSQL_DATABASE};
		grant all on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%';
		delete from mysql.user where user='';
		delete from mysql.user where user='root';
		flush privileges;
EOF

fi

# start the MariaDB server
mysqld -u mysql
