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

> TL;DR: Publisher YAML scaffold for writing data source items to supported targets.

```yaml
Publishers:
  - Name:
    Configuration:
    Iterations:
    Loop:
    SleepTimeMs:
    Stage:
    DataSourceNames: []
    DataSourcePatterns: []
    Policies:
      - AdvancedLoadBalance:
        Stages:
          - Rate:
            Amount:
            TimeIntervalMs:
            TimeoutMs:
        Count:
          Count:
        IncreasingLoadBalance:
          MaxRate:
          StartRate:
          RateIncrease:
          RateIncreaseIntervalMs:
          TimeIntervalMs:
        LoadBalance:
          Rate:
          TimeIntervalMs:
        Timeout:
          TimeoutMs:
    Chunk:
      ChunkSize:
    DataFilter:
      Body:
      MetaData:
      Timestamp:
    ElasticIndex:
      IndexName:
      Password:
      Url:
      Username:
      BatchSize:
      PublishAsync:
      RequestTimeoutMs:
    KafkaTopic:
      Password:
      TopicName:
      Username:
      CompressionLevel:
      CompressionType:
      DefaultKafkaKey:
      Headers:
      MessageMaxBytes:
      MessageSendMaxRetries:
      MessageSendRetriesIntervalMs:
      Partition:
      QueueBufferingBackpressureThreshold:
      QueueBufferingMaxKbytes:
      QueueBufferingMaxMessages:
      SaslMechanism:
      SecurityProtocol:
      HostNames: []
    MongoDbCollection:
      CollectionName:
      ConnectionString:
      DatabaseName:
    MsSqlTable:
      ConnectionString:
      TableName:
      CommandTimeoutSeconds:
      IsUDTInsertion:
    OracleSqlTable:
      ConnectionString:
      TableName:
      CommandTimeoutSeconds:
    Parallel:
      Parallelism:
    PostgreSqlTable:
      ConnectionString:
      TableName:
      CommandTimeoutSeconds:
    RabbitMq:
      Host:
      ContentType:
      ContinuationTimeoutSeconds:
      ExchangeName:
      Expiration:
      HandshakeContinuationTimeoutSeconds:
      Headers:
      Password:
      Port:
      QueueName:
      RequestedConnectionTimeoutSeconds:
      RoutingKey:
      Type:
      Username:
      VirtualHost:
    Redis:
      RedisDataType:
      AbortOnConnectFail:
      AsyncTimeout:
      BatchSize:
      ClientName:
      CommandFlags:
      ConnectRetry:
      KeepAlive:
      Password:
      RedisDataBase:
      Retries:
      RetryIntervalMs:
      Ssl:
      SslHost:
      Username:
      When:
      HostNames: []
    S3Bucket:
      AccessKey:
      SecretKey:
      ServiceURL:
      StorageBucket:
      ForcePathStyle:
      Prefix:
      Retries:
      S3SentObjectsNaming:
      S3StorageClass:
    Serialize:
      Serializer:
    Sftp:
      Hostname:
      Password:
      Path:
      Username:
      NamingType:
      Port:
      Prefix:
    Socket:
      Host:
      Port:
      ProtocolType:
      AddressFamily:
      BufferSize:
      LingerTimeSeconds:
      NagleAlgorithm:
      SendTimeoutMs:
      SocketType:
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
