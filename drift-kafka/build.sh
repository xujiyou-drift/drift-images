#!/usr/bin/env bash

docker build -t registry.prod.bbdops.com/common/drift-kafka:v0.0.16  ./
docker push registry.prod.bbdops.com/common/drift-kafka:v0.0.16