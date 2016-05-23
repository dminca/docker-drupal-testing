PROJECT_NAME = dockerizeddrupal

.PHONY: up down restart clean-containers clean-images clean

up:
	docker-compose up

down:
	docker-compose stop

in:
	docker exec -ti $(docker ps -f name="$PROJECT_NAME_web_1") /bin/bash

restart:
	docker-compose restart

clean: clean-containers clean-images

clean-containers:
	docker rm -v $$(docker ps -aq -f status=exited)

# ATTENTION! Removes all localhost images
clean-images:
	down
	docker rmi -f `docker images -q`

default: up