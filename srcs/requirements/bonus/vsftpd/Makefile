build:
	docker build -t vsftpd .

run: build
	docker run -p 21:21 -p 20:20 --name cui --rm -it vsftpd