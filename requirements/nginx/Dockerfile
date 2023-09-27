FROM alpine:3.17

RUN apk update && apk add nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]
