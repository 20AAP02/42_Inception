#!/bin/sh

# This script ensures that necessary directories are created, 
# initializes MariaDB if needed, and sets up the specified MySQL user 
# and database. Finally, it starts the MariaDB server.

# If directory doesn't exist
if [ ! -d "/run/mysqld" ]; then

	# create it
	mkdir -p /run/mysqld
	# set ownership to the mysql user and group
	chown -R mysql:mysql /run/mysqld

fi

# If MariaDB data directoy doesn't exist
if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then

	# initialize the MariaDB data directory
	mysql_install_db --user=mysql --skip-test-db --basedir=/usr --datadir=/var/lib/mysql

	# perform a bootstrap operation and sets up the specified MySQL user and database.
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