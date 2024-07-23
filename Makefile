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
svc:
	kubectl get svc
k8s-ingress:
	kubectl apply -f k8s/manifests/ingress.yaml
ing:
	kubectl get ing
edit:
	kubectl edit svc go-web-app
# edit svc ClusterIP to  node port
# get the node port ip
nodeport-ip:
	kubectl get nodes -o wide