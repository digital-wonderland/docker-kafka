# Apache Kafka

FROM digitalwonderland/base:latest

ENV KAFKA_HOME /opt/kafka

ADD ./src /

RUN chmod +x /usr/local/sbin/start.sh

RUN yum install -y java-1.7.0-openjdk-headless tar && yum clean all

RUN curl -sS http://mirrors.koehn.com/apache/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz  | tar -xzf - -C /tmp \
  && mv /tmp/kafka_* $KAFKA_HOME \
  && chown -R root:root $KAFKA_HOME

RUN groupadd -r kafka \
  && useradd -c "Kafka" -d /var/lib/kafka -g kafka -M -r -s /sbin/nologin kafka \
  && mkdir /var/{lib,log}/kafka \
  && chown -R kafka:kafka /var/{lib,log}/kafka

# https://issues.apache.org/jira/browse/KAFKA-1204 - logging config doesn't get respected
RUN sed -i '/^KAFKA_LOG4J_OPTS=/d' $KAFKA_HOME/bin/kafka-run-class.sh

# Fix logging config
RUN ln -s /var/log/kafka $KAFKA_HOME/logs \
  && ln -s /var/log/kafka/log-cleaner.log $KAFKA_HOME/log-cleaner.log

EXPOSE 9092

VOLUME ["/var/lib/kafka"]

#ENTRYPOINT ["/usr/local/sbin/start.sh"]
