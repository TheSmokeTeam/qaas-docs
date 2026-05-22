---
id: probes.available.emptyredisbychunks.overview
slug: emptyredisbychunks
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, EmptyRedisByChunks, ProbeConfiguration]
ai_summary: "Scans the selected Redis database in batches and deletes matching keys, optionally filtering them by a regular expression."
tags: [probes]
canonical_url: /probes/availableProbes/EmptyRedisByChunks/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\EmptyRedisByChunks.cs
---

# EmptyRedisByChunks

Scans the selected Redis database in batches and deletes matching keys, optionally filtering them by a regular expression.

## What it does

Scans the selected Redis database in batches and deletes matching keys, optionally filtering them by a regular expression. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: EmptyRedisByChunksSession
    Probes:
      - Name: EmptyRedisByChunksStep
        Probe: EmptyRedisByChunks
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
        BatchSize:
        KeyRegexPattern:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `EmptyRedisByChunks` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\EmptyRedisByChunks.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
