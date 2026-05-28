# Consumers Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example

```yaml
Consumers:
  -
    Name: 'value'
    TimeoutMs: 0
    Configuration: {}
    InitialTimeoutMs: 0
    Stage: 0
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
    DataFilter:
      Body: True
      MetaData: True
      Timestamp: True
    Deserialize:
      Deserializer: 'Binary'
      SpecificType:
        TypeFullName: 'value'
        AssemblyName: 'value'
    ElasticIndices:
      IndexPattern: 'value'
      Password: 'value'
      Url: 'value'
      Username: 'value'
      FilterSecondsBeforeRunStartTime: 0
      MatchQueryString: '*'
      ReadBatchSize: 1000
      ReadFromRunStartTime: False
      RequestTimeoutMs: 30000
      ScrollContextExpirationMs: 100000
      TimestampField: '@timestamp'
    IbmMqQueue:
      Channel: 'value'
      HostName: 'value'
      Manager: 'value'
      Port: 0
      QueueName: 'value'
    KafkaTopic:
      GroupId: 'value'
      Password: 'value'
      TopicName: 'value'
      Username: 'value'
      AutoOffsetReset: 'Latest'
      EnableAutoCommit: True
      FetchMinBytes: 1
      FetchWaitMaxMs: 2000
      HeartbeatIntervalMs: 1000
      MaxPollIntervalMs: 15000
      MessageMaxBytes: 1000000
      PartitionAssignmentStrategy: 'Range'
      SaslMechanism: 'Gssapi'
      SecurityProtocol: 'Plaintext'
      SessionTimeOutMs: 9000
      HostNames:
        - 'value'
    MsSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      AllowNoInsertionTimeField: False
      CommandTimeoutSeconds: 30
      FilterSecondsBeforeRunStartTime: 0
      InsertionTimeField: 'value'
      InsertionTimeTimeZoneOffsetSummerTime: 0
      ReadFromRunStartTime: False
      WhereStatement: 'value'
      ColumnsToIgnore: []
    OracleSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      AllowNoInsertionTimeField: False
      CommandTimeoutSeconds: 30
      FilterSecondsBeforeRunStartTime: 0
      InsertionTimeField: 'value'
      InsertionTimeTimeZoneOffsetSummerTime: 0
      ReadFromRunStartTime: False
      WhereStatement: 'value'
      ColumnsToIgnore: []
    PostgreSqlTable:
      ConnectionString: 'value'
      TableName: 'value'
      AllowNoInsertionTimeField: False
      CommandTimeoutSeconds: 30
      FilterSecondsBeforeRunStartTime: 0
      InsertionTimeField: 'value'
      InsertionTimeTimeZoneOffsetSummerTime: 0
      IsInsertionTimeFieldTimeZoneTz: False
      ReadFromRunStartTime: False
      WhereStatement: 'value'
      ColumnsToIgnore: []
    RabbitMq:
      Host: 'value'
      ContinuationTimeoutSeconds: 5
      CreatedQueueTimeToExpireMs: 300000
      ExchangeName: 'value'
      HandshakeContinuationTimeoutSeconds: 10
      Password: 'admin'
      Port: 5672
      QueueName: 'value'
      RequestedConnectionTimeoutSeconds: 5
      RoutingKey: '/'
      Username: 'admin'
      VirtualHost: '/'
    S3Bucket:
      AccessKey: 'value'
      SecretKey: 'value'
      ServiceURL: 'value'
      StorageBucket: 'value'
      Delimiter: ''
      ForcePathStyle: True
      MaximumRetryCount: 0
      Prefix: ''
      ReadFromRunStartTime: False
      SkipEmptyObjects: False
    Socket:
      Host: 'value'
      Port: 0
      ProtocolType: 'IP'
      AddressFamily: 'Unspecified'
      BufferSize: 65536
      ReceiveTimeoutMs: 5000
      SeperationChar: 'value'
      SocketType: 'Stream'
    TrinoSqlTable:
      Catalog: 'value'
      ClientTag: 'value'
      ConnectionString: 'value'
      Hostname: 'value'
      Password: 'value'
      Schema: 'value'
      TableName: 'value'
      Username: 'value'
      AllowNoInsertionTimeField: False
      CommandTimeoutSeconds: 30
      FilterSecondsBeforeRunStartTime: 0
      InsertionTimeField: 'value'
      InsertionTimeTimeZoneOffsetSummerTime: 0
      ReadFromRunStartTime: False
      WhereStatement: 'value'
      ColumnsToIgnore: []
```

## Realistic example

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers-tableView/index.md)
