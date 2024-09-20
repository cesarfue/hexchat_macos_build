all: debug

up:
	@docker compose -f ./docker-compose.yml up -d --build

debug:
	@docker compose -f ./docker-compose.yml up --build

down:
	@docker compose -f ./docker-compose.yml down

start:
	@docker compose -f ./docker-compose.yml start

stop:
	@docker compose -f ./docker-compose.yml stop

clean:
	@docker compose -f ./docker-compose.yml down --volumes
	@docker image prune -af

rm rf:
	@docker stop $$(docker ps -a -q) 2>/dev/null
	@docker rm $$(docker ps -a -q) 2>/dev/null
	@docker volume rm $$(docker volume ls -qf dangling=true) 2>/dev/null


re: clean
	@docker compose -f ./docker-compose.yml up --build

.PHONY: all up down start stop ps re clean fclean
