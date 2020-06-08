#!/usr/bin/env bash

# 节点配置
echo "dataDir=$DATA_DIR" >> /opt/zookeeper/conf/zoo.cfg

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