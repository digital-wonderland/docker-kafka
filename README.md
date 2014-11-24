## About:

[Docker](http://www.docker.com/) image based on [digitalwonderland/oracle-jre-8](https://registry.hub.docker.com/u/digitalwonderland/oracle-jre-8/)

## Additional Software:

* [Apache Kafka](http://kafka.apache.org/)

## Usage:

The image provides a clusterable Kafka broker.

As a minimum the following environment variables must be set:

1. ```KAFKA_BROKER_ID```
2. ```KAFKA_ADVERTISED_HOST_NAME```
3. ```KAFKA_ZOOKEEPER_CONNECT```

Additional configuration can be provided via environment variables starting with ```KAFKA_```. Any matching variables will get added to Kafkas ```server.properties``` by

1. removing the ```KAFKA_``` prefix
2. transformation to lower case
3. replacing any occurences of ```_``` with ```.```

For example an environment variable ```KAFKA_NUM_PARTITIONS=3``` will result in ```num.partitions=3``` within ```server.properties```.
