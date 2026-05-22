---
id: probes.available.executerediscommands.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, ExecuteRedisCommands, ProbeConfiguration]
summary: "Executes multiple Redis commands sequentially against the selected Redis database, allowing later commands to reuse earlier results through redisResults placeholders and optional looping."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\ExecuteRedisCommands.cs -->

# ExecuteRedisCommands

Executes multiple Redis commands sequentially against the selected Redis database, allowing later commands to reuse earlier results through redisResults placeholders and optional looping.

## What it does

Executes multiple Redis commands sequentially against the selected Redis database, allowing later commands to reuse earlier results through redisResults placeholders and optional looping. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: ExecuteRedisCommandsSession
    Probes:
      - Name: ExecuteRedisCommandsStep
        Probe: ExecuteRedisCommands
        ProbeConfiguration:
        RedisDataBase:
        HostNames: []
        Username:
        Password:
        AbortOnConnectFail:
        ConnectRetry:
        ClientName:
        AsyncTimeout:
        Ssl:
        SslHost:
        KeepAlive:
        Commands: []
        RepeatUntil:
          ResultPath:
          ExpectedValue:
          MaxIterations:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `ExecuteRedisCommands` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\ExecuteRedisCommands.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
