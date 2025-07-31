#!/bin/zsh
# Script para aplicar todos os manifests do diretório k8s/

echo "Aplicando todos os manifests do diretório k8s/"
kubectl apply -f k8s/
