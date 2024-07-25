#!/bin/bash

# start minikube
minikube start

# Build the docker image for the helloworld-app application
echo "Building docker image..."
docker build -t local/helloworld-app:latest .

# Load your local image to minikube - https://minikube.sigs.k8s.io/docs/handbook/pushing/#7-loading-directly-to-in-cluster-container-runtime
echo "Loading docker image to minikube"
minikube image load local/helloworld-app:latest

# Apply the helloworld-app deployment and service
echo "Deploying helloworld-app..."
kubectl apply -f ./deployment.yaml
kubectl apply -f ./service.yaml
echo "Deployment completed, please access the app on http://localhost:8000"

# Start minukube tunnel to be able to access your app on service type loadBalancer - https://minikube.sigs.k8s.io/docs/handbook/accessing/#example-of-loadbalancer
minikube tunnel
