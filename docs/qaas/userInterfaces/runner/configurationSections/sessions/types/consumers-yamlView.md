---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.consumers-yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Consumer YAML scaffold for reading session inputs from supported back ends."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Consumers Configurations Yaml View

```yaml
Consumers:
  - Name:
    TimeoutMs:
    Configuration:
    InitialTimeoutMs:
    Stage:
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
    DataFilter:
      Body:
      MetaData:
      Timestamp:
    Deserialize:
      Deserializer:
      SpecificType:
        TypeFullName:
        AssemblyName:
    ElasticIndices:
      IndexPattern:
      Password:
      Url:
      Username:
      FilterSecondsBeforeRunStartTime:
      MatchQueryString:
      ReadBatchSize:
      ReadFromRunStartTime:
      RequestTimeoutMs:
      ScrollContextExpirationMs:
      TimestampField:
    IbmMqQueue:
      Channel:
      HostName:
      Manager:
      Port:
      QueueName:
    KafkaTopic:
      GroupId:
      Password:
      TopicName:
      Username:
      AutoOffsetReset:
      EnableAutoCommit:
      FetchMinBytes:
      FetchWaitMaxMs:
      HeartbeatIntervalMs:
      MaxPollIntervalMs:
      MessageMaxBytes:
      PartitionAssignmentStrategy:
      SaslMechanism:
      SecurityProtocol:
      SessionTimeOutMs:
      HostNames: []
    MsSqlTable:
      ConnectionString:
      TableName:
      AllowNoInsertionTimeField:
      CommandTimeoutSeconds:
      FilterSecondsBeforeRunStartTime:
      InsertionTimeField:
      InsertionTimeTimeZoneOffsetSummerTime:
      ReadFromRunStartTime:
      WhereStatement:
      ColumnsToIgnore: []
    OracleSqlTable:
      ConnectionString:
      TableName:
      AllowNoInsertionTimeField:
      CommandTimeoutSeconds:
      FilterSecondsBeforeRunStartTime:
      InsertionTimeField:
      InsertionTimeTimeZoneOffsetSummerTime:
      ReadFromRunStartTime:
      WhereStatement:
      ColumnsToIgnore: []
    PostgreSqlTable:
      ConnectionString:
      TableName:
      AllowNoInsertionTimeField:
      CommandTimeoutSeconds:
      FilterSecondsBeforeRunStartTime:
      InsertionTimeField:
      InsertionTimeTimeZoneOffsetSummerTime:
      IsInsertionTimeFieldTimeZoneTz:
      ReadFromRunStartTime:
      WhereStatement:
      ColumnsToIgnore: []
    RabbitMq:
      Host:
      ContinuationTimeoutSeconds:
      CreatedQueueTimeToExpireMs:
      ExchangeName:
      HandshakeContinuationTimeoutSeconds:
      Password:
      Port:
      QueueName:
      RequestedConnectionTimeoutSeconds:
      RoutingKey:
      Username:
      VirtualHost:
    S3Bucket:
      AccessKey:
      SecretKey:
      ServiceURL:
      StorageBucket:
      Delimiter:
      ForcePathStyle:
      MaximumRetryCount:
      Prefix:
      ReadFromRunStartTime:
      SkipEmptyObjects:
    Socket:
      Host:
      Port:
      ProtocolType:
      AddressFamily:
      BufferSize:
      ReceiveTimeoutMs:
      SeperationChar:
      SocketType:
    TrinoSqlTable:
      Catalog:
      ClientTag:
      ConnectionString:
      Hostname:
      Password:
      Schema:
      TableName:
      Username:
      AllowNoInsertionTimeField:
      CommandTimeoutSeconds:
      FilterSecondsBeforeRunStartTime:
      InsertionTimeField:
      InsertionTimeTimeZoneOffsetSummerTime:
      ReadFromRunStartTime:
      WhereStatement:
      ColumnsToIgnore: []
```
