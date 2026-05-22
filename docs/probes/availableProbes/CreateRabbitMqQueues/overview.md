---
id: probes.available.createrabbitmqqueues.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqQueues, ProbeConfiguration]
summary: "Creates one or more RabbitMQ queues with the configured queue arguments."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqQueues.cs -->

# CreateRabbitMqQueues

Creates one or more RabbitMQ queues with the configured queue arguments.

## What it does

Creates one or more RabbitMQ queues with the configured queue arguments. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: CreateRabbitMqQueuesSession
    Probes:
      - Name: CreateRabbitMqQueuesStep
        Probe: CreateRabbitMqQueues
        ProbeConfiguration:
        Host:
        Username:
        Password:
        Port:
        VirtualHost:
        Queues: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `CreateRabbitMqQueues` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqQueues.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
