---
id: qaas.userinterfaces.runner.configurationsections.sessions.configurations.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, configurations]
summary: "Session configuration YAML example."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Sessions Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  -
    Name: 'value'
    Category: 'value'
    RunUntilStage: 0
    SaveData: True
    Stage: 0
    TimeZoneId: 'Asia/Jerusalem'
    TimeoutAfterSessionMs: 0
    TimeoutBeforeSessionMs: 0
    Collectors:
      -
        Name: 'value'
        Configuration: {}
        EndTimeReachedCheckIntervalMs: 1000
        CollectionRange:
          EndTimeMs: 0
          StartTimeMs: 0
        DataFilter:
          Body: True
          MetaData: True
          Timestamp: True
        Prometheus:
          Expression: 'value'
          Url: 'value'
          ApiKey: 'value'
          SampleIntervalMs: 30000
          TimeoutMs: 120000
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
    MockerCommands:
      -
        Name: 'value'
        ServerName: 'value'
        RequestDurationMs: 3000
        RequestRetries: 3
        Stage: 4
        Command:
          ChangeActionStub:
            ActionName: 'value'
            StubName: 'value'
          Consume:
            TimeoutMs: 0
            ActionName: 'value'
            InputDataFilter:
              Body: True
              MetaData: True
              Timestamp: True
            InputDeserialize:
              Deserializer: 'Binary'
              SpecificType:
                TypeFullName: 'value'
                AssemblyName: 'value'
            OutputDataFilter:
              Body: True
              MetaData: True
              Timestamp: True
            OutputDeserialize:
              Deserializer: 'Binary'
              SpecificType:
                TypeFullName: 'value'
                AssemblyName: 'value'
          TriggerAction:
            ActionName: 'value'
            TimeoutMs: 0
        Redis:
          Host: 'value'
          AbortOnConnectFail: True
          AsyncTimeoutMs: 5000
          ClientName: 'value'
          ConnectRetry: 3
          KeepAliveSeconds: 60
          Password: 'value'
          RedisDataBase: 0
          Ssl: False
          SslHost: 'value'
          Username: 'value'
        Configuration:
          ChangeActionStub:
            ActionName: 'value'
            StubName: 'value'
          Consume:
            TimeoutMs: 0
            ActionName: 'value'
            InputDataFilter:
              Body: True
              MetaData: True
              Timestamp: True
            InputDeserialize:
              Deserializer: 'Binary'
              SpecificType:
                TypeFullName: 'value'
                AssemblyName: 'value'
            OutputDataFilter:
              Body: True
              MetaData: True
              Timestamp: True
            OutputDeserialize:
              Deserializer: 'Binary'
              SpecificType:
                TypeFullName: 'value'
                AssemblyName: 'value'
          TriggerAction:
            ActionName: 'value'
            TimeoutMs: 0
    Probes:
      -
        Name: 'value'
        Probe: 'value'
        Configuration: {}
        ProbeConfiguration: {}
        Stage: 3
        DataSourceNames: []
        DataSourcePatterns: []
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
    Stages:
      -
        StageNumber: 0
        TimeoutAfter: 0
        TimeoutBefore: 0
    Transactions:
      -
        Name: 'value'
        TimeoutMs: 0
        Configuration: {}
        Iterations: 1
        Loop: False
        SleepTimeMs: 0
        Stage: 2
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
        Grpc:
          AssemblyName: 'value'
          Host: 'value'
          Port: 0
          ProtoNameSpace: 'value'
          RpcName: 'value'
          ServiceName: 'value'
        Http:
          BaseAddress: 'value'
          Method: 'Post'
          Headers: {}
          MessageSendRetriesIntervalMs: 1000
          Port: 8080
          RequestHeaders: {}
          Retries: 1
          Route: ''
          JwtAuth:
            Secret: 'value'
            BuildJwtConfig: True
            Claims: {}
            HierarchicalClaims: 'value'
            HttpAuthScheme: 'Bearer'
            JwtAlgorithm: 'HMACSHA256Algorithm'
        InputDataFilter:
          Body: True
          MetaData: True
          Timestamp: True
        InputSerialize:
          Serializer: 'Binary'
        OutputDataFilter:
          Body: True
          MetaData: True
          Timestamp: True
        OutputDeserialize:
          Deserializer: 'Binary'
          SpecificType:
            TypeFullName: 'value'
            AssemblyName: 'value'
        Parallel:
          Parallelism: 1
```

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](tableView.md)
- [Overview](../overview.md)
