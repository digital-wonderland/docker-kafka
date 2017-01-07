[![Docker Stars](https://img.shields.io/docker/stars/digitalwonderland/kafka.svg)](https://hub.docker.com/r/digitalwonderland/kafka/) [![Docker Pulls](https://img.shields.io/docker/pulls/digitalwonderland/kafka.svg)](https://hub.docker.com/r/digitalwonderland/kafka/) [![](https://images.microbadger.com/badges/image/digitalwonderland/kafka.svg)](https://microbadger.com/images/digitalwonderland/kafka)

# About:

[Docker](http://www.docker.com/) image based on [openjdk:8-jre-alpine](https://github.com/docker-library/openjdk/blob/master/8-jre/alpine/Dockerfile)

# Additional Software:

* [Apache Kafka](http://kafka.apache.org/)

# Usage:

The image provides a clusterable Kafka broker.

As a minimum the following environment variables must be set:

1. ```KAFKA_BROKER_ID```
2. ```KAFKA_ADVERTISED_HOST_NAME```
3. ```KAFKA_ZOOKEEPER_CONNECT```

So, assuming your Docker host is ```172.17.8.101```, has [Zookeeper](http://zookeeper.apache.org/) running and should now run Kafka as well, execute the following:

```
docker run -d -e KAFKA_BROKER_ID=1 -e KAFKA_ADVERTISED_HOST_NAME=172.17.8.101 -e KAFKA_ZOOKEEPER_CONNECT=172.17.8.101 digitalwonderland/kafka
```

(if you are looking for a clusterable Zookeeper Docker image, feel free to use [digitalwonderland/zookeeper](https://github.com/digital-wonderland/docker-zookeeper))

### Additional configuration

can be provided via environment variables starting with ```KAFKA_```. Any matching variables will get added to Kafkas ```server.properties``` by

1. removing the ```KAFKA_``` prefix
2. transformation to lower case
3. replacing any occurences of ```_``` with ```.```

For example an environment variable ```KAFKA_NUM_PARTITIONS=3``` will result in ```num.partitions=3``` within ```server.properties```.
