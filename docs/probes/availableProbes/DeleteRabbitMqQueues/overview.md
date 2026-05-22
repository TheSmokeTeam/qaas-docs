---
id: probes.available.deleterabbitmqqueues.overview
slug: deleterabbitmqqueues
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DeleteRabbitMqQueues, ProbeConfiguration]
ai_summary: "Probe that deletes rabbitmq queues"
tags: [probes]
canonical_url: /probes/availableProbes/DeleteRabbitMqQueues/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqQueues.cs
---

# DeleteRabbitMqQueues

Probe that deletes rabbitmq queues

## What it does

Probe that deletes rabbitmq queues See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteRabbitMqQueuesSession
    Probes:
      - Name: DeleteRabbitMqQueuesStep
        Probe: DeleteRabbitMqQueues
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
| **YAML key** | `DeleteRabbitMqQueues` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqQueues.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
