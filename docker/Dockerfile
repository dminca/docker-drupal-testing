FROM alpine:edge
MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>
RUN apk --update add apache2 \
                  && php7-pdo \
                  && php7-opcache \
    && rm -f /var/cache/apk/*

CMD ls
