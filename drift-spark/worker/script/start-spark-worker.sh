#!/usr/bin/env bash

mv /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh
echo "export SPARK_DAEMON_JAVA_OPTS='-Dspark.deploy.recoveryMode=ZOOKEEPER  -Dspark.deploy.zookeeper.url=$ZOOKEEPER_ADDRESS  -Dspark.deploy.zookeeper.dir=/spark'" >> /opt/spark/conf/spark-env.sh
echo "SPARK_NO_DAEMONIZE=true" >> /opt/spark/conf/spark-env.sh
echo "SPARK_MASTER_PORT=7077" >> /opt/spark/conf/spark-env.sh

start-slave.sh "$SPARK_MASTER_ADDRESS"