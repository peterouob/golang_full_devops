build:
	docker build -t peterouob/go-web-app:v1 .
run:
	docker run -p 80:80 -it peterouob/go-web-app:v1
push:
	docker push peterouob/go-web-app:v1