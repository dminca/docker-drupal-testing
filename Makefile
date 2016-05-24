SHELL = /bin/sh
PROJECT_NAME = dockerizeddrupal
DRUPAL_VERSION = 8.1.1
DRUPAL_SRCNAME = drupal-$(DRUPAL_VERSION)

.PHONY: up down restart clean-containers clean-images clean

up:
	docker-compose up

down:
	docker-compose stop

in:
	docker exec -ti $$(docker ps -qf name=$(PROJECT_NAME)_web_1) /bin/bash

restart:
	docker-compose restart

clean: clean-containers clean-images

clean-containers:
	docker rm -v $$(docker ps -aq -f status=exited)

clean-images: down
	docker rmi -f `docker images -q`

build-drupal:
	wget http://ftp.drupal.org/files/projects/drupal-$(DRUPAL_VERSION).tar.gz -P app
	tar -xvzf app/$(DRUPAL_SRCNAME).tar.gz -C app --strip-components 1
	rm -rf app/$(DRUPAL_SRCNAME).tar.gz

default: up