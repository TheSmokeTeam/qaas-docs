# Transactions Configurations Yaml View

```yaml
Transactions:
  - Name:
    TimeoutMs:
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
    Grpc:
      AssemblyName:
      Host:
      Port:
      ProtoNameSpace:
      RpcName:
      ServiceName:
    Http:
      BaseAddress:
      Method:
      Headers:
      MessageSendRetriesIntervalMs:
      Port:
      RequestHeaders:
      Retries:
      Route:
      JwtAuth:
        Secret:
        BuildJwtConfig:
        Claims:
        HierarchicalClaims:
        HttpAuthScheme:
        JwtAlgorithm:
    InputDataFilter:
      Body:
      MetaData:
      Timestamp:
    InputSerialize:
      Serializer:
    OutputDataFilter:
      Body:
      MetaData:
      Timestamp:
    OutputDeserialize:
      Deserializer:
      SpecificType:
        TypeFullName:
        AssemblyName:
```
