#!/usr/bin/env bash

#docker build -t hacksoul/drift-zookeeper:v0.0.12  ./
#docker push hacksoul/drift-zookeeper:v0.0.12

docker build -t registry.prod.bbdops.com/common/drift-zookeeper:v0.0.12  ./
docker push registry.prod.bbdops.com/common/drift-zookeeper:v0.0.12