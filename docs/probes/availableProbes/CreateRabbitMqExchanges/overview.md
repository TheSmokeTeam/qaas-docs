---
id: probes.available.createrabbitmqexchanges.overview
slug: createrabbitmqexchanges
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, CreateRabbitMqExchanges, ProbeConfiguration]
ai_summary: "Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments."
tags: [probes]
canonical_url: /probes/availableProbes/CreateRabbitMqExchanges/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqExchanges.cs
---

# CreateRabbitMqExchanges

Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments.

## What it does

Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: CreateRabbitMqExchangesSession
    Probes:
      - Name: CreateRabbitMqExchangesStep
        Probe: CreateRabbitMqExchanges
        ProbeConfiguration:
        Host:
        Username:
        Password:
        Port:
        VirtualHost:
        Exchanges: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `CreateRabbitMqExchanges` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqExchanges.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
