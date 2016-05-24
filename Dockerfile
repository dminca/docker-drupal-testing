FROM php:7.0.6-apache
MAINTAINER Minca Daniel Andrei <mandrei17@gmail.com>
RUN apt-get update \
  && apt-get install --assume-yes libapache2-mod-auth-pgsql libpng12-dev libjpeg-dev libpq-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
  && docker-php-ext-install gd pdo pdo_pgsql opcache

EXPOSE 80