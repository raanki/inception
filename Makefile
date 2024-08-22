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

fclean: clean
	@sudo rm -rf /home/ranki/data/mariadb/*
	@sudo rm -rf /home/ranki/data/wordpress/*
	@docker system prune -af

.PHONY	: all build down re clean fclean
