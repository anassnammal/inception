DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
INIT = srcs/requirements/tools/init_inception.sh

all: build up

init:
	@bash $(INIT)

build: init
	@docker-compose -f $(DOCKER_COMPOSE_FILE) build

up:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) up

start:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) start

stop:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) stop

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down

rm: down
	@docker-compose -f $(DOCKER_COMPOSE_FILE) rm

clean:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes

re: clean all

resetall:
	@docker system prune -af --volumes
	@sudo rm -rf ${HOME}/data
	@docker volume prune -f
	@docker network prune -f

.PHONY: all init build up start stop down rm clean re resetall