FROM alpine:edge
MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>
ENV TIMEZONE Europe/Bucharest
ENV PHP_MEMORY_LIMIT    512M
ENV MAX_UPLOAD          50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV PHP_MAX_POST        100M
RUN	echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
	apk upgrade && \
	apk add --update tzdata && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
	echo "${TIMEZONE}" > /etc/timezone && \
	apk add --update \
  && php7-apache2 \
  && php7-gd \
  && php7-opcache \
  && php7-pdo \
  && php7-pdo_mysqli \
  && php7-pdo_pgsql 

CMD ls -lsa
