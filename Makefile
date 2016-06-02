SHELL = /bin/sh
PROJECT_NAME = $$(printf '%s\n' "${PWD##*/}") 
DRUPAL_VERSION = 8.1.2
DRUPAL_SRCNAME = drupal-$(DRUPAL_VERSION)
DRUPAL_SITES = app/sites/default
SERVER_USER = nginx

.PHONY: build-drupal build start-detached up down wipe restart clean-containers clean-images clean test

start-detached:
	docker-compose up -d

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose stop

wipe:
	docker-compose down -v --remove-orphans

in:
	docker exec -ti $$(docker ps -qf name=$$(PROJECT_NAME)_web_1) /bin/ash

restart:
	docker-compose restart

clean: clean-containers clean-images
	sudo rm -rf app

clean-containers:
	docker rm -v $$(docker ps -aq -f status=exited)

clean-images: down
	docker rmi -f `docker images -q`

build-drupal:
	wget http://ftp.drupal.org/files/projects/drupal-$(DRUPAL_VERSION).tar.gz -P app
	tar -xzf app/$(DRUPAL_SRCNAME).tar.gz -C app --strip-components 1
	rm -rf app/$(DRUPAL_SRCNAME).tar.gz
	cp $(DRUPAL_SITES)/default.settings.php $(DRUPAL_SITES)/settings.php
	cp $(DRUPAL_SITES)/default.services.yml $(DRUPAL_SITES)/services.yml
	mkdir $(DRUPAL_SITES)/files
	chmod 777 $(DRUPAL_SITES)/files
	chmod 777 $(DRUPAL_SITES)/settings.php

test: build-drupal build start-detached restart down clean

default: build
