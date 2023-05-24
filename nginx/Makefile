build:
	docker build -t nginx_kev .

run:
	docker run -it --rm --name web -p 80:80 -p 443:443 --mount type=volume,source=www,target=/var/www  nginx_kev

clean:
	docker volume rm www

re: clean build run
