---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.publishers-yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Publisher YAML scaffold for writing data source items to supported targets."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Publishers Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
Publishers:
  -
    Name: 'value'
    Configuration: {}
    Iterations: 1
    Loop: False
    SleepTimeMs: 0
    Stage: 1
    DataSourceNames: []
    DataSourcePatterns: []
    Policies:
      -
        AdvancedLoadBalance:
          Stages:
            -
              Rate: 1.0
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
      CompressionLevel: 0
      CompressionType: 'None'
      DefaultKafkaKey: 'value'
      Headers: {}
      MessageMaxBytes: 1000000
      MessageSendMaxRetries: 10
      MessageSendRetriesIntervalMs: 1000
      Partition: -1
      QueueBufferingBackpressureThreshold: 1
      QueueBufferingMaxKbytes: 1048576
      QueueBufferingMaxMessages: 100000
      SaslMechanism: 'Gssapi'
      SecurityProtocol: 'Plaintext'
      HostNames:
        - 'value'
    MongoDbCollection:
      CollectionName: 'value'
      ConnectionString: 'value'
      DatabaseName: 'value'
    MsSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      CommandTimeoutSeconds: 30
      IsUDTInsertion: False
    OracleSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      CommandTimeoutSeconds: 30
    Parallel:
      Parallelism: 1
    PostgreSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      CommandTimeoutSeconds: 30
    RabbitMq:
      Host: 'value'
      ContentType: 'value'
      ContinuationTimeoutSeconds: 5
      ExchangeName: 'value'
      Expiration: 'value'
      HandshakeContinuationTimeoutSeconds: 10
      Headers: {}
      Password: 'admin'
      Port: 5672
      QueueName: 'value'
      RequestedConnectionTimeoutSeconds: 5
      RoutingKey: '/'
      Type: 'value'
      Username: 'admin'
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

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](publishers-tableView.md)
