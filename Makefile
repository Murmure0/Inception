

all:
	docker-compose -f srcs/docker-compose.yml build
	mkdir -p /home/mberthet/data
	mkdir -p /home/mberthet/data/wordpress
	mkdir -p /home/mberthet/data/database
	chmod 777 /etc/hosts
	echo "127.0.0.1 mberthet.42.fr" >> /etc/hosts
	echo "127.0.0.1 www.mberthet.42.fr" >> /etc/hosts
	docker-compose -f srcs/docker-compose.yml up --detach

build:
	docker-compose -f srcs/docker-compose.yml build

up:
	docker-compose -f srcs/docker-compose.yml up --detach

down:
	docker-compose -f srcs/docker-compose.yml down

clean: 
	docker-compose -f srcs/docker-compose.yml down -v --rmi all

fclean: down clean
	docker system prune -af --volumes
	rm -rf /home/mberthet/data
	docker network prune -f
	echo docker volume rm $(docker volume ls -q)
	docker image prune -f

re: fclean all

.PHONY: all build up down clean fclean re