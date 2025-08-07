#!/bin/bash

echo "=== Containers IPs ==="
for container in $(docker compose ps -q); do
  name=$(docker inspect --format='{{.Name}}' $container | sed 's/\///')
  ip=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container)
  echo "$name: $ip"
done

echo -e "\n=== Gateway API Tests ==="
echo "Testing Gateway root endpoint:"
curl -s http://localhost:5000/

echo -e "\nTesting Hello endpoint via Gateway:"
curl -s http://localhost:5000/hello

echo -e "\nTesting Bye endpoint via Gateway:"
curl -s http://localhost:5000/bye

echo -e "\nTesting Study endpoint via Gateway:"
curl -s http://localhost:5000/study

echo -e "\nTesting Thanks endpoint via Gateway:"
curl -s http://localhost:5000/thanks

echo -e "\n=== Direct Container Tests ==="
echo "Testing hello-container directly (port 5001):"
curl -s http://localhost:5001/ || echo "Could not parse JSON response: $(curl -s http://localhost:5001/)"

echo -e "\nTesting bye-container directly (port 5002):"
curl -s http://localhost:5002/ || echo "Could not parse JSON response: $(curl -s http://localhost:5002/)"

echo -e "\nTesting study-container directly (port 5003):"
curl -s http://localhost:5003/ || echo "Could not parse JSON response: $(curl -s http://localhost:5003/)"

echo -e "\nTesting thanks-container directly (port 5004):"
curl -s http://localhost:5004/ || echo "Could not parse JSON response: $(curl -s http://localhost:5004/)"
