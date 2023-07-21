FROM debian:buster

RUN apt update -y && apt upgrade -y \
    apt install -y nginx && apt install openssl -y


# COPY ./conf/default /etc/nginx/sites-available/

COPY ./tools/script.sh /

CMD [ "/script.sh" ]