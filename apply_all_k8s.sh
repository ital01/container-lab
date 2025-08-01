#!/bin/zsh

echo "Aplicando todos os manifests do diretório k8s/"
kubectl apply -f k8s/
