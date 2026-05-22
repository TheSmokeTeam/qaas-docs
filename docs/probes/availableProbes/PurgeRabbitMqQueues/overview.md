---
id: probes.available.purgerabbitmqqueues.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, PurgeRabbitMqQueues, ProbeConfiguration]
summary: "Probe that purges rabbitmq queues"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\PurgeRabbitMqQueues.cs -->

# PurgeRabbitMqQueues

Probe that purges rabbitmq queues

## What it does

Probe that purges rabbitmq queues See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: PurgeRabbitMqQueuesSession
    Probes:
      - Name: PurgeRabbitMqQueuesStep
        Probe: PurgeRabbitMqQueues
        ProbeConfiguration:
        Host:
        Username:
        Password:
        Port:
        VirtualHost:
        QueueNames: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `PurgeRabbitMqQueues` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\PurgeRabbitMqQueues.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
