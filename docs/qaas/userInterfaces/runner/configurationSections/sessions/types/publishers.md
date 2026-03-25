# Publishers

Publishers are communication actions that send data to the system. Every publisher creates an `Input` in `SessionData` with its own name.

**Table Property Path** - `Sessions[].Publishers[]`

## RabbitMq

Publishes messages to a RabbitMQ exchange or queue.

**Table Property Path** - `Sessions[].Publishers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Publishes messages to a Kafka topic.

**Table Property Path** - `Sessions[].Publishers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

## Redis

Publishes messages to a Redis cache.

**Table Property Path** - `Sessions[].Publishers[].Redis`

```yaml
Redis: {}
```

!!! Notice "Batch Publishing"
Redis publisher uses batch publishing by default. When `BatchSize` is `1`, it behaves like single-message publishing. When batch publishing is enabled, policies apply per batch rather than per message.

## OracleSqlTable

Publishes messages to an Oracle SQL database table.

**Table Property Path** - `Sessions[].Publishers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Publishes messages to an MS SQL database table.

**Table Property Path** - `Sessions[].Publishers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Publishes messages to a PostgreSQL database table.

**Table Property Path** - `Sessions[].Publishers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## MongoDbCollection

Publishes documents to a MongoDB collection.

**Table Property Path** - `Sessions[].Publishers[].MongoDbCollection`

```yaml
MongoDbCollection: {}
```

## S3Bucket

Publishes messages to an S3 bucket.

**Table Property Path** - `Sessions[].Publishers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndex

Publishes documents to an Elasticsearch index.

**Table Property Path** - `Sessions[].Publishers[].ElasticIndex`

```yaml
ElasticIndex: {}
```

!!! warning "ElasticSearch server timeout"
When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

## Socket

Publishes messages using a socket to a remote host.

**Table Property Path** - `Sessions[].Publishers[].Socket`

```yaml
Socket: {}
```

## Sftp

Publishes messages to a remote SFTP server.

**Table Property Path** - `Sessions[].Publishers[].Sftp`

```yaml
Sftp: {}
```
