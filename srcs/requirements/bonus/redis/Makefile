build:
	docker build -t rredis .

run: build
	docker run --rm -d --name cui rredis

exec:
	docker exec -it cui bash

clean:
	docker rm -f cui