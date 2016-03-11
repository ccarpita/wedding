FROM alpine:3.2
RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY src/public /usr/share/nginx/html
COPY vendor/lightbox-2.6/css/* /usr/share/nginx/html/css/
COPY vendor/lightbox-2.6/js/* /usr/share/nginx/html/js/
COPY vendor/lightbox-2.6/img/* /usr/share/nginx/html/img/

CMD ["nginx", "-g", "daemon off;"]
