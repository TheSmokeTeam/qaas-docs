# Publishers Configurations Yaml View

> TL;DR: Publisher YAML scaffold for writing data source items to supported targets.

```yaml
Publishers:
  - Name: "value"
    Configuration: "${value}"
    Iterations: "${value}"
    Loop: "${value}"
    SleepTimeMs: "${value}"
    Stage: "${value}"
    DataSourceNames:
      - "value"
    DataSourcePatterns:
      - "value"
    Policies:
      - AdvancedLoadBalance:
          Stages:
            - Rate: "${value}"
              Amount: "${value}"
              TimeIntervalMs: "${value}"
              TimeoutMs: "${value}"
        Count:
          Count: "${value}"
        IncreasingLoadBalance:
          MaxRate: "${value}"
          StartRate: "${value}"
          RateIncrease: "${value}"
          RateIncreaseIntervalMs: "${value}"
          TimeIntervalMs: "${value}"
        LoadBalance:
          Rate: "${value}"
          TimeIntervalMs: "${value}"
        Timeout:
          TimeoutMs: "${value}"
    Chunk:
      ChunkSize: "${value}"
    DataFilter:
      Body: "${value}"
      MetaData: "${value}"
      Timestamp: "${value}"
    ElasticIndex:
      IndexName: "value"
      Password: "value"
      Url: "value"
      Username: "value"
      BatchSize: "${value}"
      PublishAsync: "${value}"
      RequestTimeoutMs: "${value}"
    KafkaTopic:
      Password: "value"
      TopicName: "value"
      Username: "value"
      CompressionLevel: "${value}"
      CompressionType: "None"
      DefaultKafkaKey: "value"
      Headers: "${value}"
      MessageMaxBytes: "${value}"
      MessageSendMaxRetries: "${value}"
      MessageSendRetriesIntervalMs: "${value}"
      Partition: "${value}"
      QueueBufferingBackpressureThreshold: "${value}"
      QueueBufferingMaxKbytes: "${value}"
      QueueBufferingMaxMessages: "${value}"
      SaslMechanism: "Gssapi"
      SecurityProtocol: "Plaintext"
      HostNames:
        - "value"
    MongoDbCollection:
      CollectionName: "value"
      ConnectionString: "value"
      DatabaseName: "value"
    MsSqlTable:
      ConnectionString: "value"
      TableName: "value"
      CommandTimeoutSeconds: "${value}"
      IsUDTInsertion: "${value}"
    OracleSqlTable:
      ConnectionString: "value"
      TableName: "value"
      CommandTimeoutSeconds: "${value}"
    Parallel:
      Parallelism: "${value}"
    PostgreSqlTable:
      ConnectionString: "value"
      TableName: "value"
      CommandTimeoutSeconds: "${value}"
    RabbitMq:
      Host: "value"
      ContentType: "value"
      ContinuationTimeoutSeconds: "${value}"
      ExchangeName: "value"
      Expiration: "value"
      HandshakeContinuationTimeoutSeconds: "${value}"
      Headers: "${value}"
      Password: "admin"
      Port: "${value}"
      QueueName: "value"
      RequestedConnectionTimeoutSeconds: "${value}"
      RoutingKey: "/"
      Type: "value"
      Username: "admin"
      VirtualHost: "/"
    Redis:
      RedisDataType: "SetString"
      AbortOnConnectFail: "${value}"
      AsyncTimeout: "${value}"
      BatchSize: "${value}"
      ClientName: "value"
      CommandFlags: "None"
      ConnectRetry: "${value}"
      KeepAlive: "${value}"
      Password: "value"
      RedisDataBase: "${value}"
      Retries: "${value}"
      RetryIntervalMs: "${value}"
      Ssl: "${value}"
      SslHost: "value"
      Username: "value"
      When: "Always"
      HostNames:
        - "value"
    S3Bucket:
      AccessKey: "value"
      SecretKey: "value"
      ServiceURL: "value"
      StorageBucket: "value"
      ForcePathStyle: "${value}"
      Prefix: ""
      Retries: "${value}"
      S3SentObjectsNaming: "GrowingNumericalSeries"
      S3StorageClass: "DeepArchive"
    Serialize:
      Serializer: "Binary"
    Sftp:
      Hostname: "value"
      Password: "value"
      Path: "value"
      Username: "value"
      NamingType: "GrowingNumericalSeries"
      Port: "${value}"
      Prefix: ""
    Socket:
      Host: "value"
      Port: "${value}"
      ProtocolType: "IP"
      AddressFamily: "Unspecified"
      BufferSize: "${value}"
      LingerTimeSeconds: "${value}"
      NagleAlgorithm: "${value}"
      SendTimeoutMs: "${value}"
      SocketType: "Stream"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
