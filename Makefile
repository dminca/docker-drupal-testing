SHELL = /bin/sh
PROJECT_NAME = $$(printf '%s\n' "${PWD##*/}") 
DRUPAL_VERSION = 8.2.5
DRUPAL_SRCNAME = drupal-$(DRUPAL_VERSION)
DRUPAL_SITES = app/sites/default
DRUPAL_SHA = 41c1ba9573e4974494a5ce0888366638132e798e2b71ea7130b197f88f22a5fe

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
	sudo rm -rf app db

clean-containers:
	docker rm -v $$(docker ps -aq -f status=exited)

clean-images: down
	docker rmi -f `docker images -q`

build-drupal:
	wget http://ftp.drupal.org/files/projects/drupal-$(DRUPAL_VERSION).tar.gz -P app
	cd app; echo "$(DRUPAL_SRCNAME).tar.gz  $(DRUPAL_SHA)" | sha256sum -c - | grep "OK";cd -
	tar -xzf app/$(DRUPAL_SRCNAME).tar.gz -C app --strip-components 1
	rm -rf app/$(DRUPAL_SRCNAME).tar.gz
	cp $(DRUPAL_SITES)/default.settings.php $(DRUPAL_SITES)/settings.php
	cp $(DRUPAL_SITES)/default.services.yml $(DRUPAL_SITES)/services.yml
	chmod 666 $(DRUPAL_SITES)/settings.php $(DRUPAL_SITES)/services.yml
	mkdir $(DRUPAL_SITES)/files
	mkdir db
	chmod 777 $(DRUPAL_SITES)/files
	# set permissions for the app folder
	./conf.sh perms

test: build-drupal build start-detached restart down clean

default: build
