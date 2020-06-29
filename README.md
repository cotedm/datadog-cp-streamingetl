A demo of the Confluent Platform integrating with Datadog.

Based on the [Streaming ETL Pipline example](https://docs.ksqldb.io/en/latest/tutorials/etl/?_ga=2.210782677.1703750526.1591788966-2099790183.1588796881&_gac=1.262933374.1589825156.CjwKCAjw5Ij2BRBdEiwA0Frc9WH4ZGyvm0jy0emMIPMzUxhzno2eY1_EVrOosKsa5zJdXh6HdloEXBoCeXIQAvD_BwE)

To use:

## Pull in the necessary connectors from Confluent Hub
```
mkdir confluent-hub-components
confluent-hub install --component-dir confluent-hub-components --no-prompt debezium/debezium-connector-postgresql:1.1.0
confluent-hub install --component-dir confluent-hub-components --no-prompt debezium/debezium-connector-mongodb:1.1.0
confluent-hub install --component-dir confluent-hub-components --no-prompt confluentinc/kafka-connect-elasticsearch:5.5.0
```

## Start services
```
docker-compose up -d
```

## Setup Postgres
```
./setup_postgres.sh
./populate_postgres.sh (this will generate a continuous load on postgres)
```

## Setup Mongo
```
./setup_mongo.sh
/etc/setup.sh (from inside Mongo container)
exit
```

## Start stream processing
```
docker exec -it ksqldb-cli ksql http://ksqldb-server:8088
run each command in connectors_streams.ksql at the above command line
```

## See results in Elasticsearch
```
./es_shipped_orders.sh
```
## Import Datadog Dashboard
File to import called StreamingETLDashboard.json

## Take a look around Control Center
navigate to http://localhost:9021 in a browser
