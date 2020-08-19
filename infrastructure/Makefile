DOCKER_COMPOSE = docker-compose

init: ../services/*
	@echo Initializing project...
	@cd $^ && yarn install

up:
	$(DOCKER_COMPOSE) up -d --remove-orphans

logs:
	$(DOCKER_COMPOSE) logs -f $(filter-out $@,$(MAKECMDGOALS))

down:
	$(DOCKER_COMPOSE) down
