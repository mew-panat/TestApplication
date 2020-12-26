check-cluster-connection:
	kubectl config current-context
	
install-nginx:
	echo "Install Nginx"
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo update
	helm install ingress-nginx ingress-nginx/ingress-nginx

install-cat-application:
	echo "Install Cat Application"
	helm upgrade --install cat-application ./helm/cat-application
	curl http://a72ec93bb404c4d5bbf1af38fe47e389-755560048.us-east-2.elb.amazonaws.com/cats -o cat-app.html

test-cat-application:
	echo "Test Cat Application"
	cat cat-app.html

install-meow-application:
	echo "Install Meow Application"
	helm upgrade --install meow-application ./helm/meow-application
	curl http://a72ec93bb404c4d5bbf1af38fe47e389-755560048.us-east-2.elb.amazonaws.com/meow -o meow-app.html

test-meow-application:
	echo "Test Meow Application"
	cat meow-app.html