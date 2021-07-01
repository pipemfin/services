minikube start --vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f ./srcs/metallb-config.yaml
eval $(minikube docker-env)
docker build ./srcs/mysql --tag mysql-image
kubectl apply -f ./srcs/mysql/mysql-container.yaml
docker build ./srcs/nginx --tag nginx-image
docker build ./srcs/phpmyadmin --tag phpmyadmin-image
docker build ./srcs/influxdb --tag influxdb-image
docker build ./srcs/grafana --tag grafana-image
docker build ./srcs/ftps --tag ftps-image
docker build ./srcs/wordpress --tag wordpress-image
kubectl apply -f ./srcs/nginx/nginx-container.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-container.yaml
kubectl apply -f ./srcs/influxdb/influxdb-container.yaml
kubectl apply -f ./srcs/grafana/grafana-container.yaml
kubectl apply -f ./srcs/ftps/ftps-container.yaml
kubectl apply -f ./srcs/wordpress/wordpress-container.yaml