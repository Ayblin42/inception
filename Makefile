RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"




all: 
	docker-compose -f srcs/docker-compose.yml up -d

info:
	@docker image ls -a && echo
	@docker container ls -a && echo
	@docker network ls && echo
	@docker volume ls && echo

clean:
	docker-compose -f srcs/docker-compose.yml down -v
fclean: clean
	@sudo rm -rf /home/ayblin/data/mariadb/*
	@sudo rm -rf /home/ayblin/data/wordpress/*
	@docker system prune -af

re: fclean all
