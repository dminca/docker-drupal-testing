FROM alpine:edge
MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>
ENV TERM dumb
RUN set -x \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk update && apk upgrade \
  && apk add --update \
    supervisor \
    nginx \
    php7 \
    php7-fpm \
    php7-ctype \
    php7-session \
    php7-dom \
    php7-mcrypt \
    php7-openssl \
    php7-xml \
    php7-json \
    php7-gd \
    php7-opcache \
    php7-pdo \
    php7-pdo_pgsql \
    php7-curl \
    php7-ftp \
    php7-apcu \
    php7-ssh2 \
    php7-phar \
    php7-zlib \
    'tar=1.28-r1' --repository http://nl.alpinelinux.org/alpine/v3.3/main \
  && rm -rf /var/cache/apk/* \
  && mkdir /tmp/nginx \
  && mkdir -p /var/www/html \
  && chown -R nginx:nginx /var/www/html \
  && sed -i 's/memory_limit = .*/memory_limit = 768M/' /etc/php7/php.ini \
  && sed -i 's/post_max_size = .*/post_max_size = 50M/' /etc/php7/php.ini \
  && echo 'date.timezone = "Europe/Bucharest"' >> /etc/php7/php.ini \
  && sed -i '/^user/c \user = nginx' /etc/php7/php-fpm.conf \
  && sed -i '/^group/c \group = nginx' /etc/php7/php-fpm.conf \
  && sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php7/php-fpm.conf
RUN ln -s /usr/bin/php7 /usr/bin/php
COPY files/default.conf /etc/nginx/conf.d/
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/supervisord.conf /etc/supervisord.conf
# install Drupal Console
RUN php -r "readfile('https://drupalconsole.com/installer');" > drupal.phar \
    && mv drupal.phar /usr/local/bin/drupal \
    && chmod +x /usr/local/bin/drupal \
    && drupal init --override
EXPOSE 80 443
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
