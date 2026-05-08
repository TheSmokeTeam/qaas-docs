# Consumers

Consumers are communication actions that receive data from the system. Every consumer creates an `Output` in `SessionData` with its own name.

Consumers are responsible for subscribing to or polling target systems to pull data back into the Runner for further processing, validation, or storage. They operate continuously or continuously query data depending on the action type and configured limits.

**Table Property Path** - `Sessions[].Consumers[]`

## RabbitMq

Consumes messages from a RabbitMQ exchange or queue. It establishes a connection and subscribes to the targeted queue using AMQP protocols. It retrieves the message body as well as all associated headers and metadata properties, adding them to the generated Output in `SessionData`.

**Table Property Path** - `Sessions[].Consumers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Consumes messages from a Kafka topic. It connects to the configured Kafka brokers and begins polling for messages in the specified topic. It can consume from a specific offset or from the latest depending on the group id and auto-offset reset settings.

**Table Property Path** - `Sessions[].Consumers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

!!! Tip "Using Kafka consumer to empty a topic"
    Kafka consumers can advance the offset for future runs. If you want to clear a topic for later consumers, run an earlier consumer with `AutoOffsetReset` set to `earliest`, then keep the later consumer on `latest`.

## OracleSqlTable

Consumes data from an Oracle SQL database table. It uses a connection string to query the table and pull relational rows into structured Output data within the Runner.

**Table Property Path** - `Sessions[].Consumers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Consumes rows from an Microsoft SQL Server database table. It establishes a secure connection to the database and streams the query result sets, parsing them into standard Outputs.

**Table Property Path** - `Sessions[].Consumers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Consumes data from a PostgreSQL database table. It connects using the Postgres protocol and queries the requested table, extracting records out of the database instance.

**Table Property Path** - `Sessions[].Consumers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## TrinoSqlTable

Consumes data using Trino distributed SQL query engine. It executes queries across multiple federated data sources through Trino and accumulates the unified result set as Output in the Runner session.

**Table Property Path** - `Sessions[].Consumers[].TrinoSqlTable`

```yaml
TrinoSqlTable: {}
```

## S3Bucket

Consumes messages and files from an Amazon S3 bucket. It targets an S3 bucket and prefix, retrieving the objects matching the criteria and downloading their payload into the Runner.

**Table Property Path** - `Sessions[].Consumers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndices

Consumes documents from Elasticsearch indices by a given index pattern. It utilizes the Search API to scan and retrieve JSON documents from the cluster based on specific matches or keyword searches.

**Table Property Path** - `Sessions[].Consumers[].ElasticIndices`

```yaml
ElasticIndices: {}
```

!!! warning "ElasticSearch server timeout"
    When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

!!! warning "Elastic keywords"
    When using keywords in Elasticsearch queries, capitalize them. Lowercase keywords can be rejected or misread by the consumer.

## Socket

Consumes messages using a raw TCP or UDP socket from a remote host. It binds to or connects to a socket endpoint and waits for incoming byte streams, converting received chunks into Output items.

**Table Property Path** - `Sessions[].Consumers[].Socket`

```yaml
Socket: {}
```

## IbmMqQueue

Consumes messages from an IBM MQ queue. It authenticates with the IBM MQ server and subscribes to the message queue, pulling messages out as they arrive into the system.

**Table Property Path** - `Sessions[].Consumers[].IbmMqQueue`

```yaml
IbmMqQueue: {}
```
