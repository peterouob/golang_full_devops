build:
	docker build -t peter123ouob/go-web-app:v1 .
run:
	docker run -p 80:80 -it peter123ouob/go-web-app:v1
push:
	docker push peter123ouob/go-web-app:v1