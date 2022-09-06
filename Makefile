all:
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up --detach

stop:
	docker-compose -f srcs/docker-compose.yml down

clean: stop
	docker system prune -af --volumes

fclean: stop clean

re: fclean all

.PHONY: all stop clean fclean re