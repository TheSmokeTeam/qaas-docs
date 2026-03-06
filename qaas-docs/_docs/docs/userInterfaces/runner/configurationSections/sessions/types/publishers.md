# Publishers

Publishers are communication actions that send data to the system. Every publisher will create an `Input` by its name in the `SessionData`.

**Table Property Path** - `Sessions[].Publishers[]`

## RabbitMq

Publishes messages to a rabbitmq exchange or queue.

**Table Property Path** - `Sessions[].Publishers[].RabbitMq`

```yaml
RabbitMq: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        MetaData:
            RabbitMq:
                RoutingKey: <string> # The routing key to send the rabbitmq message with, if none is given takes the default routing key provided from the configuration.
                Headers: <IDictionary<string, object>> # The headers to send the rabbitmq message with, if none is given takes the default headers provided from the configuration.
                Expiration: <string> # The expiration to send the rabbitmq message with, if none is given takes the default expiration provided from the configuration.
        ```

## KafkaTopic

Publishes messages to a kafka topic.

**Table Property Path** - `Sessions[].Publishers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Kafka:
                MessageKey: <byte[]> # The message key to send the kafka message with, if none is given takes the default message key provided from the configuration.
                Headers: <IDictionary<string, object?>> # The headers to send the message to kafka with, if none is given - takes default provided from configuration (if exists).
                TopicName: <string> # Dynamic name of topic to publish onto. If none is given - takes the default value provided from configuration.  
        ```

## Redis

Publishes messages to a redis cache.

**Table Property Path** - `Sessions[].Publishers[].Redis`

```yaml
Redis: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Redis:
                Key: <string> (required) # The key the redis message will be published with
                HashField: <string>
                SetScore: <double>
                GeoLongitude: <double>
                GeoLatitude: <double>
        ```

!!! Notice "Batch Publishing"
        Redis publisher uses batch publishing to publish messages (defined by BatchSize,
        all the messages are treated as one batch by default), unless BatchSize is configured to 1
        (which is equivelent to publishing without batchs). When using redis publisher with batch publishing,
        the policies configured will be per batch and not per message in the batch. for example,
        when publishing with the LoadBalance policy, rate will define the rate of batch publishing.

## OracleSqlTable

Publishes messages to an oracle SQL database table.

**Table Property Path** - `Sessions[].Publishers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <System.Text.Json.Nodes.JsonObject>
        ```

!!! tip "Oracle SQL Connection String"
        Data Source=DataBaseHost:DataBasePort/Service;User ID=UserName;Password=Password;

!!! Tip "If you need to insert a User-Defined Type (UDT), set IsUDTInsertion to true for UDT support.
         :warning: Do not use UDT support if it is not necessary, as it can slow down data insertion especially for large datasets."

!!! Notice "The data published to SQL tables"
        When publishing to any SQL table the expected data is a generation where each
        item is either a JSON object representing a row in the SQL table OR a C# object
        that will be converted by the publisher to a JSON object. (Only takes the object's
        public properties.)
        Each property's key is the relevant column's name
        and its value is the value that column will have in that row.

## MsSqlTable

Publishes messages to a mssql database table.

**Table Property Path** - `Sessions[].Publishers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <System.Text.Json.Nodes.JsonObject>
        ```

!!! tip "MsSql Connection String"
        Data Source=DataBaseHost;Initial Catalog=DataBaseName;User ID=UserName;Password=Password;

!!! Notice "The data published to SQL tables"
        When publishing to any SQL table the expected data is a generation where each
        item is either a JSON object representing a row in the SQL table OR a C# object
        that will be converted by the publisher to a JSON object (Only takes the object's
        public properties).
        Each property's key is the relevant column's name
        and its value is the value that column will have in that row.

## PostgreSqlTable

Publishes messages to a postgresql database table.

**Table Property Path** - `Sessions[].Publishers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <System.Text.Json.Nodes.JsonObject>
        ```

!!! tip "MsSql Connection String"
        Data Source=DataBaseHost;Initial Catalog=DataBaseName;User ID=UserName;Password=Password;

!!! Notice "The data published to SQL tables"
        When publishing to any SQL table the expected data is a generation where each
        item is either a JSON object representing a row in the SQL table OR a C# object
        that will be converted by the publisher to a JSON object (Only takes the object's
        public properties).
        Each property's key is the relevant column's name
        and its value is the value that column will have in that row.

## S3Bucket

Publishes messages to a s3 bucket.

**Table Property Path** - `Sessions[].Publishers[].S3Bucket`

```yaml
S3Bucket: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Storage:
                Key: <string> # The key to publish the s3 object with (on top of the configured prefix).
        ```

## ElasticIndex

Publishes documents to an elasticsearch index.

**Table Property Path** - `Sessions[].Publishers[].ElasticIndex`

```yaml
ElasticIndex: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <System.Text.Json.Nodes.JsonNode>
        ```

!!! warning "ElasticSearch server timeout"
        When sending requests to the elasticsearch server it's important to understand that it has its
        own configured maximum request timeout, so if you still encounter the same timeout after increasing
        the `RequestTimeoutMilliseconds` field it might be the elasticsearch's server timeout.

!!! Notice "The data published to an elastic index"
        The JSON document must either be a JsonNode object or a C# object
        that will be converted automatically by the publisher to a JSON object.

## Socket

Publishes messages using a socket from a remote host.

**Table Property Path** - `Sessions[].Publishers[].Socket`

```yaml
Socket: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        ```

## Sftp

Publishes messages to a remote sftp server

**Table Property Path** - `Sessions[].Publishers[].Sftp`

```yaml
Sftp: {}
```

!!! info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Storage:
                Key: <string> # The name of the published file (on top of the given path).
        ```
