# Consumers

Consumers are communication actions that receive data from the system. Every consumer creates an `Output` in `SessionData` with its own name.

**Table Property Path** - `Sessions[].Consumers[]`

## RabbitMq

Consumes messages from a RabbitMQ exchange or queue.

**Table Property Path** - `Sessions[].Consumers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Consumes messages from a Kafka topic.

**Table Property Path** - `Sessions[].Consumers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

!!! Tip "Using Kafka consumer to empty a topic"
Kafka consumers can advance the offset for future runs. If you want to clear a topic for later consumers, run an earlier consumer with `AutoOffsetReset` set to `earliest`, then keep the later consumer on `latest`.

## OracleSqlTable

Consumes messages from an Oracle SQL database table.

**Table Property Path** - `Sessions[].Consumers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Consumes messages from an MS SQL database table.

**Table Property Path** - `Sessions[].Consumers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Consumes messages from a PostgreSQL database table.

**Table Property Path** - `Sessions[].Consumers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## TrinoSqlTable

Consumes messages from a Trino database table.

**Table Property Path** - `Sessions[].Consumers[].TrinoSqlTable`

```yaml
TrinoSqlTable: {}
```

## S3Bucket

Consumes messages from an S3 bucket.

**Table Property Path** - `Sessions[].Consumers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndices

Consumes documents from Elasticsearch indices by an index pattern.

**Table Property Path** - `Sessions[].Consumers[].ElasticIndices`

```yaml
ElasticIndices: {}
```

!!! warning "ElasticSearch server timeout"
When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

!!! warning "Elastic keywords"
When using keywords in Elasticsearch queries, capitalize them. Lowercase keywords can be rejected or misread by the consumer.

## Socket

Consumes messages using a socket from a remote host.

**Table Property Path** - `Sessions[].Consumers[].Socket`

```yaml
Socket: {}
```

## IbmMqQueue

Consumes messages from an IBM MQ queue.

**Table Property Path** - `Sessions[].Consumers[].IbmMqQueue`

```yaml
IbmMqQueue: {}
```
