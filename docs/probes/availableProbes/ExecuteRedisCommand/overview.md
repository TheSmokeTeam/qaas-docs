---
id: probes.available.executerediscommand.overview
slug: executerediscommand
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, ExecuteRedisCommand, ProbeConfiguration]
ai_summary: "Executes one Redis command with optional arguments against the selected Redis database, optionally storing the result for later redisResults placeholder reuse."
tags: [probes]
canonical_url: /probes/availableProbes/ExecuteRedisCommand/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\ExecuteRedisCommand.cs
---

# ExecuteRedisCommand

Executes one Redis command with optional arguments against the selected Redis database, optionally storing the result for later redisResults placeholder reuse.

## What it does

Executes one Redis command with optional arguments against the selected Redis database, optionally storing the result for later redisResults placeholder reuse. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: ExecuteRedisCommandSession
    Probes:
      - Name: ExecuteRedisCommandStep
        Probe: ExecuteRedisCommand
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
        Command:
        Arguments: []
        StoreResultAs:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `ExecuteRedisCommand` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\ExecuteRedisCommand.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
