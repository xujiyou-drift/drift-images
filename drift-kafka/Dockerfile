FROM ubuntu:16.04

ARG KAFKA_VERSION=2.5.0
ARG SCALA_VERSION=2.12

RUN set -x \
    && apt-get update \
    && apt-get install -y openjdk-8-jre-headless wget netcat-openbsd \
    && wget -U mozilla "https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" \
    && tar -xzf "kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" -C /opt \
    && rm -r "kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" \
    && mv /opt/kafka_$SCALA_VERSION-$KAFKA_VERSION /opt/kafka

COPY script /opt/script

RUN chmod +x /opt/script/start-kafka.sh

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV KAFKA_HOME=/opt/kafka
ENV PATH=${PATH}:${JAVA_HOME}/bin:${KAFKA_HOME}/bin:/opt/script

ENTRYPOINT ["start-kafka.sh"]