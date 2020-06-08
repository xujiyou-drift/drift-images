FROM ubuntu:16.04

ARG GPG_KEY=C823E3E5B12AF29C67F81976F5CECB3CB5E9BD2D
ARG ZK_DIST=zookeeper-3.6.1

RUN set -x \
    && apt-get update \
    && apt-get install -y openjdk-8-jre-headless wget netcat-openbsd \
    && wget -q "https://downloads.apache.org/zookeeper/$ZK_DIST/apache-$ZK_DIST-bin.tar.gz" \
    && tar -xzf "apache-$ZK_DIST-bin.tar.gz" -C /opt \
    && rm -r "apache-$ZK_DIST-bin.tar.gz" \
    && mv /opt/apache-"$ZK_DIST"-bin /opt/zookeeper

COPY script /opt/script

RUN chmod +x /opt/script/start-zookeeper.sh

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV ZOOKEEPER_HOME=/opt/zookeeper
ENV PATH=${PATH}:${JAVA_HOME}/bin:${ZOOKEEPER_HOME}/bin:/opt/script

ENTRYPOINT ["start-zookeeper.sh"]