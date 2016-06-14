FROM alpine:edge

MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>


RUN apk update && apk upgrade \
  && apk add ca-certificates bash \
  && apk add --update \
    supervisor \
    nginx \
    php7 \
    php7-gd \
    php7-opcache \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_pgsql \
  && rm -rf /var/cache/apk/* \
  && mkdir /tmp/nginx \
  && mkdir -p /var/www/html \
  && echo "<?php phpinfo(); ?>" > /var/www/html/index.php \
  && chown -R nginx:nginx /var/www/html \
  && sed -i 's/memory_limit = .*/memory_limit = 768M/' /etc/php/php.ini \
  && sed -i 's/post_max_size = .*/post_max_size = 50M/' /etc/php/php.ini \
  && echo 'date.timezone = "Europe/Bucharest"' >> /etc/php/php.ini \
  && sed -i '/^user/c \user = nginx' /etc/php/php-fpm.conf \
  && sed -i '/^group/c \group = nginx' /etc/php/php-fpm.conf \
  && sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php/php-fpm.conf

ENV TERM dumb


COPY files/default.conf /etc/nginx/conf.d/
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/supervisord.conf /etc/supervisord.conf

EXPOSE 80 443
CMD ["supervisord"]