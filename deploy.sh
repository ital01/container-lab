#!/bin/zsh

for dir in hello-container bye-container study-container thanks-container; do
  echo "\nBuilding $dir..."
  docker build -t $dir $dir/
done

echo "\nAplicando manifests do Kubernetes..."
kubectl apply -f k8s/

echo "\nStatus dos pods:"
kubectl get pods
