# Transactions Configurations Yaml View

> TL;DR: Transaction YAML scaffold for HTTP or gRPC request-response actions.

```yaml
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
