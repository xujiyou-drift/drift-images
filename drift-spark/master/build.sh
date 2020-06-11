#!/usr/bin/env bash

docker build -t registry.prod.bbdops.com/common/drift-spark-master:v0.0.1  ./
docker push registry.prod.bbdops.com/common/drift-spark-master:v0.0.1