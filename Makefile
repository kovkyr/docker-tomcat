include .env

help:
	@echo ""
	@echo "Usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  docker-create                Create containers, then start containers"
	@echo "  docker-delete                Destroy containers"
	@echo "  docker-recreate              Execute docker-delete and docker-create"
	@echo ""
	@echo "  docker-start                 Start containers"
	@echo "  docker-stop                  Stop containers"
	@echo "  docker-restart               Execute docker-stop and docker-start"
	@echo ""
	@echo "  shell-tomcat                 Enter tomcat container"
	@echo ""

docker-create:
	@docker compose build
	@docker compose up -d --wait

docker-delete:
	@docker compose down

docker-recreate: docker-delete docker-create

docker-start:
	@docker compose up -d --wait

docker-stop:
	@docker compose down

docker-restart: docker-stop docker-start

shell-tomcat:
	@docker compose exec -it tomcat /bin/bash
