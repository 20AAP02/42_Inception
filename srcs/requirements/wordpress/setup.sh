#!/bin/sh

# wait for mariadb to start
while ! mysql -h mariadb -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} 2> /dev/null; do
sleep 1
done

wp core is-installed 2> /dev/null
if [ $? -ne 0 ] ; then
	wp core download --allow-root
	wp core config --dbname=${MYSQL_DATABASE} \
				   --dbuser=${MYSQL_USER} \
				   --dbpass=${MYSQL_PASSWORD} \
				   --dbhost=${WORDPRESS_DB_HOST}
	wp core install --url=${DOMAIN} \
					--title=${TITLE} \
					--admin_user=${WORDPRESS_ADMIN} \
					--admin_email=${WORDPRESS_ADMIN_EMAIL} \
					--admin_password=${WORDPRESS_ADMIN_PASSWD}
	wp user create ${WORDPRESS_USER} \
					${WORDPRESS_USER_EMAIL} \
					--user_pass=${WORDPRESS_USER_PASSWD}
fi

/usr/sbin/php-fpm7
