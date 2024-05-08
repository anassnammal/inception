DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
INIT = srcs/requirements/tools/init_inception.sh

all: build run

init:
	@bash $(INIT)

build: init
	@docker-compose -f $(DOCKER_COMPOSE_FILE) build

run:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up

start:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) start

stop:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) stop

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean: down
	@docker-compose -f $(DOCKER_COMPOSE_FILE) rm

fclean:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes

re: fclean all

resetall:
	@docker system prune -a
	@sudo rm -rf ${HOME}/data

.PHONY: all init build run start stop down clean re