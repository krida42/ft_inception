FILE := srcs/docker-compose.yml
DC := docker-compose -f $(FILE)

build:
	$(DC) build -q

up: build
	$(DC) up -d

down:
	$(DC) down

clean:
	$(DC) down -v

re: clean up

ps:
	$(DC)  ps -a

logs:
	$(DC) logs
