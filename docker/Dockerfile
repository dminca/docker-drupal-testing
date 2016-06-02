FROM alpine:3.3
MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>

RUN apk --update add apache2 php-apache2

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd"]

CMD ["-DFOREGROUND"]
