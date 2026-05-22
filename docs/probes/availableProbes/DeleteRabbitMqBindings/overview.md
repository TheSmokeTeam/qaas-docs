---
id: probes.available.deleterabbitmqbindings.overview
slug: deleterabbitmqbindings
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DeleteRabbitMqBindings, ProbeConfiguration]
ai_summary: "Deletes RabbitMQ bindings using the configured source, destination, routing key, and binding type."
tags: [probes]
canonical_url: /probes/availableProbes/DeleteRabbitMqBindings/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqBindings.cs
---

# DeleteRabbitMqBindings

Deletes RabbitMQ bindings using the configured source, destination, routing key, and binding type.

## What it does

Deletes RabbitMQ bindings using the configured source, destination, routing key, and binding type. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteRabbitMqBindingsSession
    Probes:
      - Name: DeleteRabbitMqBindingsStep
        Probe: DeleteRabbitMqBindings
        ProbeConfiguration:
        Host:
        Username:
        Password:
        Port:
        VirtualHost:
        Bindings: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DeleteRabbitMqBindings` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqBindings.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
