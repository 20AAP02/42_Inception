FROM alpine:3.17

RUN apk update \
	&& apk add nginx

# ---------------------------- nginx configuration --------------------------- #
COPY nginx.conf /etc/nginx/http.d/default.conf

# add system user(www-data)
RUN adduser -S www-data
# replace user from nginx to www-data in the Nginx configuration file (nginx.conf)
RUN sed -i -e 's/user nginx;/user  www-data;/g' /etc/nginx/nginx.conf

WORKDIR /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
