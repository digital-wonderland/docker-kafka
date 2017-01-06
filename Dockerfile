# Apache Kafka

FROM digitalwonderland/oracle-jre-8:latest

ARG KAFKA_VERSION=0.10.1.1
ARG KAFKA_MIRROR=http://www-eu.apache.org
ARG KAFKA_SCALA_VERSION=2.11

ENV KAFKA_HOME /opt/kafka

ADD ./src /

RUN chmod +x /usr/local/sbin/start.sh

RUN rpm --rebuilddb && yum install -y tar && yum clean all

RUN curl -sS ${KAFKA_MIRROR}/dist//kafka/${KAFKA_VERSION}/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz  | tar -xzf - -C /tmp \
  && mv /tmp/kafka_* $KAFKA_HOME \
  && chown -R root:root $KAFKA_HOME

RUN groupadd -r kafka \
  && useradd -c "Kafka" -d /var/lib/kafka -g kafka -M -r -s /sbin/nologin kafka \
  && mkdir /var/{lib,log}/kafka \
  && chown -R kafka:kafka /var/{lib,log}/kafka

EXPOSE 9092

VOLUME ["/var/lib/kafka"]

ENTRYPOINT ["/usr/local/sbin/start.sh"]
