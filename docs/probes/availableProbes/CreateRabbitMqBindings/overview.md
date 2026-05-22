---
id: probes.available.createrabbitmqbindings.overview
slug: createrabbitmqbindings
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, CreateRabbitMqBindings, ProbeConfiguration]
ai_summary: "Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions."
tags: [probes]
canonical_url: /probes/availableProbes/CreateRabbitMqBindings/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqBindings.cs
---

# CreateRabbitMqBindings

Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions.

## What it does

Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: CreateRabbitMqBindingsSession
    Probes:
      - Name: CreateRabbitMqBindingsStep
        Probe: CreateRabbitMqBindings
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
| **YAML key** | `CreateRabbitMqBindings` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqBindings.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
