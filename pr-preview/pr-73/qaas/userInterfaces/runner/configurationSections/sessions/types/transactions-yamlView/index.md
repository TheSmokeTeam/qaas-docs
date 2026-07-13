# Transactions Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example

```yaml
Transactions:
  -
    Name: 'value'
    TimeoutMs: 0
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

## Realistic example

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions-tableView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
