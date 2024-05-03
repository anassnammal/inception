DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
VOLUME_INIT = srcs/requirements/tools/init_inception.sh

all: init build run

init:
	bash $(VOLUME_INIT)

build:
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

run: 
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

start:
	docker-compose -f $(DOCKER_COMPOSE_FILE) start

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean: down
	docker-compose -f $(DOCKER_COMPOSE_FILE) rm

fclean:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes
	rm -rf ${HOME}/data

re: fclean all

resetall:
	docker system prune -a
	sudo rm -rf ${HOME}/data

.PHONY: all init build run start stop down clean re