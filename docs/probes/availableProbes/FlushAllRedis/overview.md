---
id: probes.available.flushallredis.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, FlushAllRedis, ProbeConfiguration]
summary: "Runs Redis FLUSHALL against the configured server to remove keys from every database."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\FlushAllRedis.cs -->

# FlushAllRedis

Runs Redis FLUSHALL against the configured server to remove keys from every database.

## What it does

Runs Redis FLUSHALL against the configured server to remove keys from every database. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FlushAllRedisSession
    Probes:
      - Name: FlushAllRedisStep
        Probe: FlushAllRedis
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
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `FlushAllRedis` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RedisProbes\FlushAllRedis.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
