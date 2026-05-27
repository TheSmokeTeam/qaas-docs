---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.transactions-yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Transaction YAML scaffold for HTTP or gRPC request-response actions."
---

# Transactions Configurations Yaml View

```yaml
Transactions:
  - Name:
    TimeoutMs:
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
    Parallel:
      Parallelism:
```
