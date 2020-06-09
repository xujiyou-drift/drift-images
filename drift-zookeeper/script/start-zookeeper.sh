#!/usr/bin/env bash

# 节点配置
echo "tickTime=2000" >> /opt/zookeeper/conf/zoo.cfg
echo "initLimit=10" >> /opt/zookeeper/conf/zoo.cfg
echo "syncLimit=5" >> /opt/zookeeper/conf/zoo.cfg
echo "clientPort=2181" >> /opt/zookeeper/conf/zoo.cfg
echo "dataDir=$DATA_DIR" >> /opt/zookeeper/conf/zoo.cfg

# 配置监控
echo "metricsProvider.className=org.apache.zookeeper.metrics.prometheus.PrometheusMetricsProvider" >> /opt/zookeeper/conf/zoo.cfg
echo "metricsProvider.httpPort=7000" >> /opt/zookeeper/conf/zoo.cfg
echo "metricsProvider.exportJvmInfo=true" >> /opt/zookeeper/conf/zoo.cfg

# 集群配置
DOMAIN=$(hostname -d)
for (( i=1; i<=$SERVER_NUMBER; i++ )); do
    echo "server.$i=$STATEFUL_SET_NAME-$((i-1)).$DOMAIN:$SERVER_PORT:$ELECTION_PORT" >> /opt/zookeeper/conf/zoo.cfg
done

ID=$(hostname | xargs echo |awk -F- '{print $NF}')
mkdir "$DATA_DIR"
echo "$((ID+1))" > "$DATA_DIR"/myid

## 启动 ZK
zkServer.sh start-foreground