#!/usr/bin/env bash

#docker build -t hacksoul/drift-zookeeper:v0.0.13  ./
#docker push hacksoul/drift-zookeeper:v0.0.13

docker build -t registry.prod.bbdops.com/common/drift-zookeeper:v0.0.14  ./
docker push registry.prod.bbdops.com/common/drift-zookeeper:v0.0.14