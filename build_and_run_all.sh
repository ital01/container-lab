#!/bin/zsh

for dir in */Dockerfile; do
  service_dir=${dir%/Dockerfile}
  echo "Buildando imagem para $service_dir..."
  docker build -t $service_dir ./$service_dir
  echo "Rodando container para $service_dir..."
  docker run -d --name $service_dir $service_dir
  echo "---"
done
