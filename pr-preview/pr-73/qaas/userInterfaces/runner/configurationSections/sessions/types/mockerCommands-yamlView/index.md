# Mocker Commands Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example

```yaml
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
```

## Realistic example

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands-tableView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
