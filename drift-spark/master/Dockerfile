FROM ubuntu:16.04

ARG SPARK_VERSION=spark-2.4.6

RUN set -x \
    && apt-get update \
    && apt-get install -y openjdk-8-jre-headless wget netcat-openbsd \
    && wget -U mozilla "https://mirrors.tuna.tsinghua.edu.cn/apache/spark/$SPARK_VERSION/$SPARK_VERSION-bin-without-hadoop.tgz" \
    && tar -xzf "$SPARK_VERSION-bin-without-hadoop.tgz" -C /opt \
    && rm -r "$SPARK_VERSION-bin-without-hadoop.tgz" \
    && mv /opt/"$SPARK_VERSION"-bin-without-hadoop /opt/spark

COPY script /opt/script

RUN chmod +x /opt/script/start-spark-master.sh

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV SPARK_HOME=/opt/spark
ENV PATH=${PATH}:${JAVA_HOME}/bin:${SPARK_HOME}/bin:${SPARK_HOME}/sbin:/opt/script

ENTRYPOINT ["start-spark-master.sh"]