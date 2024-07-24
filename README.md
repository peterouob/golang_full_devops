## DOCKER

## K8s

### kubectl

### eks

## AWS
### IAM

## helm
- 對不同環境有不同的image範本邊號
### Chart
### Template
- rm rf *
- copy the file which use in k8s 

## CICD
- CI : github action
- CD : gitops/argo 
- CI 中DOCKER HUB 的key可以在github repo 的setting 中找到Secrets and Variables中的Actions設置
  - DOCKER HUB 可以在DOCKERHUB的Settings/Personal access tokens中申請(READ & Write)
  - Github Token 到github setting 中的Developer settings中的Personal access tokens 裡的Tokens創建
    - repo
    - write:packages
### CI Stage
1. build and test
2. static code analyze
3. docker image push
4. update helm
### Argo CD
1. install
  ```
  kubectl create namespace argocd
  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  ```
2. Access the argo cd ui
  ```
  kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
  ```
3. Get the Loadbalancer service IP
  ```
  kubectl get svc argocd-server -n argocd
  ```
4. Open Argocd and login
  - how login is written in Makefile get argocd 
    - username is admin
    - password can find the solution in Makefile which name is get argocd-password
5. 配置 Argocd 詳請請看gitops/argocd內的圖片
pull helm to deploy on kubernetes