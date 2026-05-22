---
id: probes.available.flushdbredis.overview
slug: flushdbredis
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, FlushDbRedis, ProbeConfiguration]
ai_summary: "Runs Redis FLUSHDB against the selected Redis database."
tags: [probes]
canonical_url: /probes/availableProbes/FlushDbRedis/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\FlushDbRedis.cs
---

# FlushDbRedis

Runs Redis FLUSHDB against the selected Redis database.

## What it does

Runs Redis FLUSHDB against the selected Redis database. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FlushDbRedisSession
    Probes:
      - Name: FlushDbRedisStep
        Probe: FlushDbRedis
        ProbeConfiguration:
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
        RedisDataBase:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `FlushDbRedis` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\FlushDbRedis.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
