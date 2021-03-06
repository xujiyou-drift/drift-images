#!/usr/bin/env bash

# 启动前，需要设置的环境变量为 DATA_DIR、ZOOKEEPER_ADDRESS
# 设置配置文件
CONFI_FILE=/opt/kafka/config/server.properties
cp $CONFI_FILE $CONFI_FILE.back

# 处理配置文件，去掉默认配置
sed 's/broker.id=0//' $CONFI_FILE.back > $CONFI_FILE
sed 's/log.dirs=.*//' $CONFI_FILE.back > $CONFI_FILE
sed 's/zookeeper.connect=.*//' $CONFI_FILE.back > $CONFI_FILE

# 集群配置
ID=$(hostname | xargs echo |awk -F- '{print $NF}')
echo "broker.id=$ID" >> $CONFI_FILE

INSIDE_ADDRESS="$(hostname).$(hostname -d)"
echo "listener.security.protocol.map=INSIDE:PLAINTEXT,OUTSIDE:PLAINTEXT" >> $CONFI_FILE
echo "inter.broker.listener.name=INSIDE" >> $CONFI_FILE
echo "listeners=INSIDE://$INSIDE_ADDRESS:9092,OUTSIDE://$INSIDE_ADDRESS:9094" >> $CONFI_FILE
echo "advertised.listeners=INSIDE://$INSIDE_ADDRESS:9092,OUTSIDE://$EXTERNAL_ADDRESS:3109$ID" >> $CONFI_FILE

mkdir -p "$DATA_DIR"
echo "log.dirs=$DATA_DIR" >> $CONFI_FILE
echo "zookeeper.connect=$ZOOKEEPER_ADDRESS" >> $CONFI_FILE

#前台启动 kafka
kafka-server-start.sh $CONFI_FILE