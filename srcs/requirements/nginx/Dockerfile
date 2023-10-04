FROM alpine:3.17

RUN apk update \
	&& apk add nginx

# ---------------------------- nginx configuration --------------------------- #
COPY nginx.conf /etc/nginx/http.d/default.conf

# setup www-data as user
RUN adduser -S www-data
RUN sed -i -e 's/user nginx;/user  www-data;/g' /etc/nginx/nginx.conf

WORKDIR /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
