SHELL = /bin/sh
PROJECT_NAME = dockerizeddrupal
DRUPAL_VERSION = 8.1.1
DRUPAL_SRCNAME = drupal-$(DRUPAL_VERSION)
DRUPAL_SITES = app/sites/default

.PHONY: build-drupal build up down restart clean-containers clean-images clean test

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose stop

in:
	docker exec -ti $$(docker ps -qf name=$(PROJECT_NAME)_web_1) /bin/bash

restart:
	docker-compose restart

clean: clean-containers clean-images
	rm -rf app

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
	chmod a+w $(DRUPAL_SITES)/settings.php $(DRUPAL_SITES)/services.yml
	chmod a+w $(DRUPAL_SITES)
	mkdir $(DRUPAL_SITES)/files
	chmod a+w $(DRUPAL_SITES)/files

test: build-drupal build up restart down clean

default: build