RED = "\033[1;31m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"




all: 
	docker-compose up -d 

info:
	@docker image ls -a && echo
	@docker container ls -a && echo
	@docker network ls && echo
	@docker volume ls && echo

clean:
	docker-compose down -v
fclean: clean
	@sudo rm -rf data/mariadb/*
	@sudo rm -rf data/wordpress/*
	@sudo docker system prune -af

re: fclean all
