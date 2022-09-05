all:
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up --detach

stop:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker system prune -af --volumes

fclean: stop clean

.PHONY:all stop clean