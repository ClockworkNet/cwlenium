#!/bin/bash

# Halt on error
set -e

# should probably check presence of image before doing pull
docker pull elgalu/selenium:3
docker pull dosel/zalenium:3
docker-compose up -d zalenium

echo "If you want to follow along with progress, open another terminal and type:"
echo "    docker-compose logs -f"
# Give Zalenium enought time to spin up and register a node.
sleep 8
