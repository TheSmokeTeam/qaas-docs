# Sessions Configurations Yaml View

> TL;DR: Session configuration YAML example.

```yaml
Sessions:
  - Name: "value"
    Category: "value"
    RunUntilStage: "${value}"
    SaveData: "${value}"
    Stage: "${value}"
    TimeZoneId: "Asia/Jerusalem"
    TimeoutAfterSessionMs: "${value}"
    TimeoutBeforeSessionMs: "${value}"
    Collectors:
      - Name: "value"
        Configuration: "${value}"
        EndTimeReachedCheckIntervalMs: "${value}"
        CollectionRange:
          EndTimeMs: "${value}"
          StartTimeMs: "${value}"
        DataFilter:
          Body: "${value}"
          MetaData: "${value}"
          Timestamp: "${value}"
        Prometheus:
          Expression: "value"
          Url: "value"
          ApiKey: "value"
          SampleIntervalMs: "${value}"
          TimeoutMs: "${value}"
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
    MockerCommands:
      - Name: "value"
        ServerName: "value"
        RequestDurationMs: "${value}"
        RequestRetries: "${value}"
        Stage: "${value}"
        Command:
          ChangeActionStub:
            ActionName: "value"
            StubName: "value"
          Consume:
            TimeoutMs: "${value}"
            ActionName: "value"
            InputDataFilter:
              Body: "${value}"
              MetaData: "${value}"
              Timestamp: "${value}"
            InputDeserialize:
              Deserializer: "Binary"
              SpecificType:
                TypeFullName: "value"
                AssemblyName: "value"
            OutputDataFilter:
              Body: "${value}"
              MetaData: "${value}"
              Timestamp: "${value}"
            OutputDeserialize:
              Deserializer: "Binary"
              SpecificType:
                TypeFullName: "value"
                AssemblyName: "value"
          TriggerAction:
            ActionName: "value"
            TimeoutMs: "${value}"
        Redis:
          Host: "value"
          AbortOnConnectFail: "${value}"
          AsyncTimeoutMs: "${value}"
          ClientName: "value"
          ConnectRetry: "${value}"
          KeepAliveSeconds: "${value}"
          Password: "value"
          RedisDataBase: "${value}"
          Ssl: "${value}"
          SslHost: "value"
          Username: "value"
        Configuration:
          ChangeActionStub:
            ActionName: "value"
            StubName: "value"
          Consume:
            TimeoutMs: "${value}"
            ActionName: "value"
            InputDataFilter:
              Body: "${value}"
              MetaData: "${value}"
              Timestamp: "${value}"
            InputDeserialize:
              Deserializer: "Binary"
              SpecificType:
                TypeFullName: "value"
                AssemblyName: "value"
            OutputDataFilter:
              Body: "${value}"
              MetaData: "${value}"
              Timestamp: "${value}"
            OutputDeserialize:
              Deserializer: "Binary"
              SpecificType:
                TypeFullName: "value"
                AssemblyName: "value"
          TriggerAction:
            ActionName: "value"
            TimeoutMs: "${value}"
    Probes:
      - Name: "value"
        Probe: "CreateRabbitMqBindings"
        Configuration: "${value}"
        ProbeConfiguration: "${value}"
        Stage: "${value}"
        DataSourceNames:
          - "value"
        DataSourcePatterns:
          - "value"
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
    Stages:
      - StageNumber: "${value}"
        TimeoutAfter: "${value}"
        TimeoutBefore: "${value}"
    Transactions:
      - Name: "value"
        TimeoutMs: "${value}"
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
        Grpc:
          AssemblyName: "value"
          Host: "value"
          Port: "${value}"
          ProtoNameSpace: "value"
          RpcName: "value"
          ServiceName: "value"
        Http:
          BaseAddress: "value"
          Method: "Post"
          Headers: "${value}"
          MessageSendRetriesIntervalMs: "${value}"
          Port: "${value}"
          RequestHeaders: "${value}"
          Retries: "${value}"
          Route: ""
          JwtAuth:
            Secret: "value"
            BuildJwtConfig: "${value}"
            Claims: "${value}"
            HierarchicalClaims: "value"
            HttpAuthScheme: "Bearer"
            JwtAlgorithm: "HMACSHA256Algorithm"
        InputDataFilter:
          Body: "${value}"
          MetaData: "${value}"
          Timestamp: "${value}"
        InputSerialize:
          Serializer: "Binary"
        OutputDataFilter:
          Body: "${value}"
          MetaData: "${value}"
          Timestamp: "${value}"
        OutputDeserialize:
          Deserializer: "Binary"
          SpecificType:
            TypeFullName: "value"
            AssemblyName: "value"
        Parallel:
          Parallelism: "${value}"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
