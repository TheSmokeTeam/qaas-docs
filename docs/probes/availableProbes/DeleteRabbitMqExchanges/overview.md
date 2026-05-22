---
id: probes.available.deleterabbitmqexchanges.overview
slug: deleterabbitmqexchanges
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DeleteRabbitMqExchanges, ProbeConfiguration]
ai_summary: "Probe that deletes rabbitmq exchanges"
tags: [probes]
canonical_url: /probes/availableProbes/DeleteRabbitMqExchanges/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqExchanges.cs
---

# DeleteRabbitMqExchanges

Probe that deletes rabbitmq exchanges

## What it does

Probe that deletes rabbitmq exchanges See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteRabbitMqExchangesSession
    Probes:
      - Name: DeleteRabbitMqExchangesStep
        Probe: DeleteRabbitMqExchanges
        ProbeConfiguration:
        Host:
        Username:
        Password:
        Port:
        VirtualHost:
        ExchangeNames: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DeleteRabbitMqExchanges` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqExchanges.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
