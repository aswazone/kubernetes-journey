set -e 

NAME="kubernetes-journey-api"
USERNAME="aswamanu"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image $IMAGE ..."
docker build -t $IMAGE .

echo "Pushing Image to Dockerhub ..."
docker push $IMAGE

echo "Applying Kubernetes manifests ..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods ..."
kubectl get pods

echo "Getting services ..."
kubectl get services

echo "Fetching the main service ..."
kubectl get services $NAME-service