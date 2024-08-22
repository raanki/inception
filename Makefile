all: up

up:
	@sh ./srcs/requirements/ranki_mkdir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:
	@make fclean
	@make all

clean: down
	@docker system prune -a

fclean: down
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes

.PHONY	: all build down re clean fclean
