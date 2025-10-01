FROM confluentinc/cp-kafka-connect:7.5.0

RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:2.2.1
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.5.7
RUN confluent-hub install --no-prompt iceberg/iceberg-kafka-connect:1.9.2

COPY secret-providers /opt/secret-providers