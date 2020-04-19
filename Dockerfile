FROM strimzi/kafka:0.16.2-kafka-2.4.0
# strimzi/kafka:0.14.0-kafka-2.3.0
USER root:root
RUN mkdir -p /opt/kafka/plugins

COPY kafka-connect-elasticsearch-5.1.4.jar /opt/kafka/plugins

USER 1001