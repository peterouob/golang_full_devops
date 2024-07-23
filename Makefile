build:
	docker build -t peter123ouob/go-web-app:v1 .
run:
	docker run -p 80:80 -it peter123ouob/go-web-app:v1
push:
	docker push peter123ouob/go-web-app:v1
k8s-deploy:
	kubectl apply -f k8s/manifests/deployment.yaml
pods:
	kubectl get pods
k8s-service:
	kubectl apply -f k8s/manifests/service.yaml
