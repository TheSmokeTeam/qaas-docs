---
id: probes.available.createrabbitmqvirtualhosts.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqVirtualHosts, ProbeConfiguration]
summary: "Creates RabbitMQ virtual hosts through the management API so later probes and sessions can use them."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqVirtualHosts.cs -->

# CreateRabbitMqVirtualHosts

Creates RabbitMQ virtual hosts through the management API so later probes and sessions can use them.

## What it does

Creates RabbitMQ virtual hosts through the management API so later probes and sessions can use them. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: CreateRabbitMqVirtualHostsSession
    Probes:
      - Name: CreateRabbitMqVirtualHostsStep
        Probe: CreateRabbitMqVirtualHosts
        ProbeConfiguration:
        ManagementScheme:
        ManagementPort:
        AllowInvalidServerCertificates:
        RequestTimeoutMs:
        Host:
        Username:
        Password:
        Port:
        VirtualHost:
        VirtualHosts: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `CreateRabbitMqVirtualHosts` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqVirtualHosts.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
