# Consumers Configurations Yaml View

> TL;DR: Consumer YAML scaffold for reading session inputs from supported back ends.

```yaml
Consumers:
  - Name: "value"
    TimeoutMs: "${value}"
    Configuration: "${value}"
    InitialTimeoutMs: "${value}"
    Stage: "${value}"
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
    DataFilter:
      Body: "${value}"
      MetaData: "${value}"
      Timestamp: "${value}"
    Deserialize:
      Deserializer: "Binary"
      SpecificType:
        TypeFullName: "value"
        AssemblyName: "value"
    ElasticIndices:
      IndexPattern: "value"
      Password: "value"
      Url: "value"
      Username: "value"
      FilterSecondsBeforeRunStartTime: "${value}"
      MatchQueryString: "*"
      ReadBatchSize: "${value}"
      ReadFromRunStartTime: "${value}"
      RequestTimeoutMs: "${value}"
      ScrollContextExpirationMs: "${value}"
      TimestampField: "@timestamp"
    IbmMqQueue:
      Channel: "value"
      HostName: "value"
      Manager: "value"
      Port: "${value}"
      QueueName: "value"
    KafkaTopic:
      GroupId: "value"
      Password: "value"
      TopicName: "value"
      Username: "value"
      AutoOffsetReset: "Latest"
      EnableAutoCommit: "${value}"
      FetchMinBytes: "${value}"
      FetchWaitMaxMs: "${value}"
      HeartbeatIntervalMs: "${value}"
      MaxPollIntervalMs: "${value}"
      MessageMaxBytes: "${value}"
      PartitionAssignmentStrategy: "Range"
      SaslMechanism: "Gssapi"
      SecurityProtocol: "Plaintext"
      SessionTimeOutMs: "${value}"
      HostNames:
        - "value"
    MsSqlTable:
      ConnectionString: "value"
      TableName: "value"
      AllowNoInsertionTimeField: "${value}"
      CommandTimeoutSeconds: "${value}"
      FilterSecondsBeforeRunStartTime: "${value}"
      InsertionTimeField: "value"
      InsertionTimeTimeZoneOffsetSummerTime: "${value}"
      ReadFromRunStartTime: "${value}"
      WhereStatement: "value"
      ColumnsToIgnore:
        - "value"
    OracleSqlTable:
      ConnectionString: "value"
      TableName: "value"
      AllowNoInsertionTimeField: "${value}"
      CommandTimeoutSeconds: "${value}"
      FilterSecondsBeforeRunStartTime: "${value}"
      InsertionTimeField: "value"
      InsertionTimeTimeZoneOffsetSummerTime: "${value}"
      ReadFromRunStartTime: "${value}"
      WhereStatement: "value"
      ColumnsToIgnore:
        - "value"
    PostgreSqlTable:
      ConnectionString: "value"
      TableName: "value"
      AllowNoInsertionTimeField: "${value}"
      CommandTimeoutSeconds: "${value}"
      FilterSecondsBeforeRunStartTime: "${value}"
      InsertionTimeField: "value"
      InsertionTimeTimeZoneOffsetSummerTime: "${value}"
      IsInsertionTimeFieldTimeZoneTz: "${value}"
      ReadFromRunStartTime: "${value}"
      WhereStatement: "value"
      ColumnsToIgnore:
        - "value"
    RabbitMq:
      Host: "value"
      ContinuationTimeoutSeconds: "${value}"
      CreatedQueueTimeToExpireMs: "${value}"
      ExchangeName: "value"
      HandshakeContinuationTimeoutSeconds: "${value}"
      Password: "admin"
      Port: "${value}"
      QueueName: "value"
      RequestedConnectionTimeoutSeconds: "${value}"
      RoutingKey: "/"
      Username: "admin"
      VirtualHost: "/"
    S3Bucket:
      AccessKey: "value"
      SecretKey: "value"
      ServiceURL: "value"
      StorageBucket: "value"
      Delimiter: ""
      ForcePathStyle: "${value}"
      MaximumRetryCount: "${value}"
      Prefix: ""
      ReadFromRunStartTime: "${value}"
      SkipEmptyObjects: "${value}"
    Socket:
      Host: "value"
      Port: "${value}"
      ProtocolType: "IP"
      AddressFamily: "Unspecified"
      BufferSize: "${value}"
      ReceiveTimeoutMs: "${value}"
      SeperationChar: "value"
      SocketType: "Stream"
    TrinoSqlTable:
      Catalog: "value"
      ClientTag: "value"
      ConnectionString: "value"
      Hostname: "value"
      Password: "value"
      Schema: "value"
      TableName: "value"
      Username: "value"
      AllowNoInsertionTimeField: "${value}"
      CommandTimeoutSeconds: "${value}"
      FilterSecondsBeforeRunStartTime: "${value}"
      InsertionTimeField: "value"
      InsertionTimeTimeZoneOffsetSummerTime: "${value}"
      ReadFromRunStartTime: "${value}"
      WhereStatement: "value"
      ColumnsToIgnore:
        - "value"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
