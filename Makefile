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
edit-svc:
	kubectl edit svc go-web-app
edit-deploy:
	kubectl edit deploy go-web-app
# edit svc ClusterIP to  node port
# get the node port ip
nodeport-ip:
	kubectl get nodes -o wide
helm-create:
	cd helm
	helm create go-web-app-chart
	cd create go-web-app-chart
	rm -rf charts
	cd tempalte
	rm -rf *
	cp ../../../manifests/* .
all:
	kubectl get all
delete:
	kubectl delete deploy go-web-app
	kubectl delete svc go-web-app
	kubectl delete ing go-web-app
helm-install:
	helm install go-web-app ./go-web-app-chart
deployment:
	kubectl get deployment
helm-uninstall:
	helm uninstall go-web-app
ci:
	git add .
	git commit -am "feat: implemented CI"
	git push
get-argocd:
	kubectl get svc -n argocd
get-argocd-password:
	kubectl get secrets -n argocd
	kubectl edit secret argocd-initial-admin-secret -n argocd
	echo TzNWaHJEbFdZajlRV0w2WQ== | base64 --decode