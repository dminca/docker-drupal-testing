FROM alpine:edge
MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>
RUN apk --update add apache2 \
                  && php7-apache2 \
                  && php7-gd \
                  && php7-pdo_pgsql \
                  && php7-pdo_mysql \
                  && php7-pdo \
                  && php7-opcache \
    && rm -f /var/cache/apk/*

CMD ls
