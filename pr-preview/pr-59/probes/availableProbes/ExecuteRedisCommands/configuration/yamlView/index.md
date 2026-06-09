# ExecuteRedisCommands Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use

Use this page when you need a starting YAML shape for this hook configuration and want all generated fields in one block.

## YAML configuration

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example

```yaml
ProbeConfiguration:
  AbortOnConnectFail: True
  AsyncTimeout: 5000
  ClientName: 'value'
  ConnectRetry: 3
  KeepAlive: 60
  Password: 'value'
  RedisDataBase: 0
  Ssl: False
  SslHost: 'value'
  UseGlobalDict: False
  Username: 'value'
  Commands:
    -
      Command: 'value'
      StoreResultAs: 'value'
      Arguments: []
  HostNames:
    - 'value'
  RepeatUntil:
    ExpectedValue: 'value'
    ResultPath: 'value'
    MaxIterations: 100
```

## Realistic example

Start with the minimal scaffold, replace placeholder values with project values, and combine it with the surrounding hook entry shown on the overview page.

## Edge cases

- Optional arrays are emitted as `[]`; add entries only when the hook needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/ExecuteRedisCommands/configuration/tableView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/ExecuteRedisCommands/overview/index.md)
