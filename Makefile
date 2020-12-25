check-cluster-connection:
	kubectl config current-context
	
install-nginx:
	echo "Install Nginx"
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo update
	helm install ingress-nginx ingress-nginx/ingress-nginx

install-cat-application:
	echo "Install Cat Application"
	helm install cat-application ./helm/cat-application

test-cat-application:
	echo "Test Cat Application"
	curl http://cat-application:8080/cats -o cat-app.html