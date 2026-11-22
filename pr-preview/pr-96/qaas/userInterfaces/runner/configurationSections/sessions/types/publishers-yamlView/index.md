# Publishers Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example

```yaml
Publishers:
  - Name: 'value'
    Iterations: 1
    Loop: False
    SleepTimeMs: 0
    Stage: 1
    DataSourceNames: []
    DataSourcePatterns: []
    Policies:
      - AdvancedLoadBalance:
          Stages:
            - Rate: 1.0
              Amount: 1
              TimeIntervalMs: 1000
              TimeoutMs: 0
        Count:
          Count: 0
        IncreasingLoadBalance:
          MaxRate: 1
          StartRate: 1
          RateIncrease: 1
          RateIncreaseIntervalMs: 1000
          TimeIntervalMs: 1000
        LoadBalance:
          Rate: 1.0
          TimeIntervalMs: 1000
        Timeout:
          TimeoutMs: 0
    Chunk:
      ChunkSize: 0
      MaxBytes: 1
    DataFilter:
      Body: True
      MetaData: True
      Timestamp: True
    ElasticIndex:
      IndexName: 'value'
      Password: 'value'
      Url: 'value'
      Username: 'value'
      BatchSize: 1
      PublishAsync: False
      RequestTimeoutMs: 30000
    KafkaTopic:
      Password: 'value'
      TopicName: 'value'
      Username: 'value'
      Acks: 'None'
      BatchSize: 1
      CompressionLevel: 0
      CompressionType: 'None'
      DefaultKafkaKey: 'value'
      EnableIdempotence: True
      FlushTimeoutMs: 1
      Headers: {}
      LingerMs: 1.0
      MaxInFlight: 1
      MessageMaxBytes: 1000000
      MessageSendMaxRetries: 10
      MessageSendRetriesIntervalMs: 1000
      MessageTimeoutMs: 0
      Partition: -1
      QueueBufferingBackpressureThreshold: 1
      QueueBufferingMaxKbytes: 1048576
      QueueBufferingMaxMessages: 100000
      ReportDeliveryErrors: False
      SaslMechanism: 'Gssapi'
      SecurityProtocol: 'Plaintext'
      HostNames:
        - 'value'
    MongoDbCollection:
      CollectionName: 'value'
      ConnectionString: 'value'
      DatabaseName: 'value'
      BypassDocumentValidation: True
      IsOrdered: True
      UseBsonDocumentDirectly: False
    MsSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      ColumnTypes: {}
      CommandTimeoutSeconds: 30
      IsUDTInsertion: False
      ParameterizeRows: False
    OracleSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      ColumnTypes: {}
      CommandTimeoutSeconds: 30
      ParameterizeRows: False
    Parallel:
      Parallelism: 1
    PostgreSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      ColumnTypes: {}
      CommandTimeoutSeconds: 30
      ParameterizeRows: False
    RabbitMq:
      Host: 'value'
      AppId: 'value'
      Arguments: {}
      AutoDelete: False
      ClusterId: 'value'
      ContentEncoding: 'value'
      ContentType: 'value'
      ContinuationTimeoutSeconds: 5
      CorrelationId: 'value'
      DeliveryMode: 1
      Durable: False
      ExchangeName: 'value'
      Exclusive: False
      Expiration: 'value'
      HandshakeContinuationTimeoutSeconds: 10
      Headers: {}
      MessageId: 'value'
      Password: 'admin'
      Persistent: True
      Port: 5672
      Priority: 0
      PublisherConfirms: False
      QueueName: 'value'
      ReplyTo: 'value'
      RequestedConnectionTimeoutSeconds: 5
      RoutingKey: '/'
      TimestampUnixTime: 0
      Type: 'value'
      UserId: 'value'
      Username: 'admin'
      ValidateTopologyOnEveryOperation: True
      VirtualHost: '/'
    Redis:
      RedisDataType: 'SetString'
      AbortOnConnectFail: True
      AsyncTimeout: 5000
      BatchSize: 0
      ClientName: 'value'
      CommandFlags: 'None'
      ConnectRetry: 3
      KeepAlive: 60
      Password: 'value'
      RedisDataBase: 0
      Retries: 1
      RetryIntervalMs: 1000
      Ssl: False
      SslHost: 'value'
      UseTransactions: True
      Username: 'value'
      When: 'Always'
      HostNames:
        - 'value'
    S3Bucket:
      AccessKey: 'value'
      SecretKey: 'value'
      ServiceURL: 'value'
      StorageBucket: 'value'
      ForcePathStyle: True
      Prefix: ''
      Retries: 0
      S3SentObjectsNaming: 'GrowingNumericalSeries'
      S3StorageClass: 'DeepArchive'
    Serialize:
      Serializer: 'Binary'
    Sftp:
      Hostname: 'value'
      Password: 'value'
      Path: 'value'
      Username: 'value'
      NamingType: 'GrowingNumericalSeries'
      Port: 22
      Prefix: ''
      UploadBufferSize: 1
    Socket:
      Host: 'value'
      Port: 0
      ProtocolType: 'IP'
      AddressFamily: 'Unspecified'
      BufferSize: 65536
      LingerTimeSeconds: 1
      NagleAlgorithm: False
      SendTimeoutMs: 5000
      SocketType: 'Stream'
```

## Realistic example

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers-tableView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
