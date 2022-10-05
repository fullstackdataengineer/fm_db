#!/usr/bin/env bash

image_name=${1:-farmers_market}
container_name=${2:-fm_1}
hostname=${3:-db}

echo image: ${image_name}
echo container: ${container_name}
echo hostname: ${hostname}

docker build . -t ${image_name}  

docker run -d --name ${container_name} -h ${hostname} -p 3306:3306 -p 33060:33060 ${image_name}
docker exec -i ${container_name} bash -c "/docker-entry-point.sh"
