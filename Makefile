FILE := srcs/docker-compose.yml
DC := docker-compose -f $(FILE)



build: create_dir
	$(DC) build

create_dir:
	mkdir -p $(HOME)/data/www
	mkdir -p $(HOME)/data/db

up: build
	$(DC) up -d

down:
	$(DC) down

clean:
	$(DC) down -v

cuicui: clean
	rm -rf /home/kevin/data/*

re: clean up

ps:
	$(DC)  ps -a

logs:
	$(DC) logs
