#!/bin/sh
echo Building cppjieba-service:build

docker build -t cppjieba-service:build . -f Dockerfile.build

docker container create --name extract cppjieba-service:build
docker container cp extract:/code/cppjieba-server/ ./cppjieba-server
docker container rm -f extract

echo Building cppjieba-service:latest

docker build --no-cache -t cppjieba-service:latest .
rm -rf ./cppjieba-server
