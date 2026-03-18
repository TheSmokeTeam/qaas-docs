# Consumers

Consumers are communication actions that receive data from the system. Every consumer will create an `Output` by its name in the `SessionData`.

**Table Property Path** - `Sessions[].Consumers[]`

## RabbitMq

Consumes messages from a rabbitmq exchange or queue.

**Table Property Path** - `Sessions[].Consumers[].RabbitMq`

```yaml
RabbitMq: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <byte[]>
MetaData:
    RabbitMq:
        RoutingKey: <string> # The routing key of the consumed rabbitmq message.
        Headers: <IDictionary<string, object>> # The headers attached to the consumed rabbitmq message.
        Expiration: <string> # The expiration of the consumed rabbitmq message.
```

## KafkaTopic

Consumes messages from a kafka topic.

**Table Property Path** - `Sessions[].Consumers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <byte[]>
MetaData:
    Kafka:
        MessageKey: <byte[]> # The message key of the consumed kafka message.
```

!!! Tip "Using kafka consumer to empty a topic"
kafka consumer can be used to advance the offset used to read messages from the topic for future
consumers. running a consumer to advance the offset before an injection is like emptying the topic,
it makes sure the new consumer won't read any of the messages that were already in the topic before
the session (as long as the new consumer's AutoOffsetReset is set to latest). For doing that it's
recommended to configure a consumer with the AutoOffsetReset set to earliest before the session.

## OracleSqlTable

Consume messages from an oracle sql database table.

**Table Property Path** - `Sessions[].Consumers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <System.Text.Json.Nodes.JsonObject>
```

???- Tip "Oracle SQL Connection String"
Data Source=DataBaseHost:DataBasePort/Service;User ID=UserName;Password=Password;

## MsSqlTable

Consume messages from an Mssql database table.

**Table Property Path** - `Sessions[].Consumers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <System.Text.Json.Nodes.JsonObject>
```

???- Tip "MsSql Connection String"
Data Source=DataBaseHost;Initial Catalog=DataBaseName;User ID=UserName;Password=Password;

## PostgreSqlTable

Consume messages from a PostgreSql database table.

**Table Property Path** - `Sessions[].Consumers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <System.Text.Json.Nodes.JsonObject>
```

???- Tip "PostgreSql Connection String"
Server=DataBaseHost;Port=DataBasePort;Database=DataBaseName;User Id=UserName;Password=Password

## TrinoSqlTable

Consumes messages from a Trino database table.

**Table Property Path** - `Sessions[].Consumers[].TrinoSqlTable`

```yaml
TrinoSqlTable: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <System.Text.Json.Nodes.JsonObject>
```

## S3Bucket

Consumes messages from a s3 bucket.

**Table Property Path** - `Sessions[].Consumers[].S3Bucket`

```yaml
S3Bucket: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <byte[]>
MetaData:
    Storage:
        Key: <string> # The key of the consumed s3 object.
```

## ElasticIndices

Consumes documents from elasticsearch indices by an index pattern.

**Table Property Path** - `Sessions[].Consumers[].ElasticIndices`

```yaml
ElasticIndices: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <System.Text.Json.Nodes.JsonNode>
```

!!! warning "ElasticSearch server timeout"
When sending requests to the elasticsearch server it's important to understand that it has its
own configured maximum request timeout, so if you still encounter the same timeout after increasing
the `RequestTimeoutMilliseconds` field it might be the elasticsearch's server timeout.

!!! warning "Elastic keywords"
When using keywords in elastic such as `AND`, make sure to capitalize them otherwise they will not be
recognized, and you might get unexpected logs in the consumer.

## Socket

Consumes messages using a socket from a remote host.

**Table Property Path** - `Sessions[].Consumers[].Socket`

```yaml
Socket: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <byte[]>
```

## IbmMqQueue

Consumes messages from a IbmMqQueue

**Table Property Path** - `Sessions[].Consumers[].IbmMqQueueConsumer`

```yaml
IbmMqQueueConsumer: {}
```

???- info "Data Structure"
=== ":octicons-file-code-16: `Output`"
```yaml
Body: <byte[]>
```