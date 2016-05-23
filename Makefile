.PHONY: build up down restart clean-containers clean-images clean

build:
	docker-compose build --force-rm

up:
	docker-compose up

down:
	docker-compose stop

restart:
	docker-compose restart

clean: clean-containers clean-images

clean-containers:
	docker rm -v $$(docker ps -aq -f status=exited)

# ATTENTION! Removes all localhost images
clean-images:
	docker rmi -f $(docker images -q)

default: build