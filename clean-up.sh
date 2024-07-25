#!/bin/bash

# Delete deployment and service
echo "Deleting go-app and service..."
kubectl delete -f ./deployment.yaml
kubectl delete -f ./service.yaml
echo "Clean-up completed."