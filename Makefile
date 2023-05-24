build:
	docker compose build

up: build
	docker compose up -d 

down:
	docker compose down -v

test:
	docker run -it --name test --rm -p 3306:3306 debian:buster bash
