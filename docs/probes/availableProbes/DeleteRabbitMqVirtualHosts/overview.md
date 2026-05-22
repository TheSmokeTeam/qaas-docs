---
id: probes.available.deleterabbitmqvirtualhosts.overview
slug: deleterabbitmqvirtualhosts
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DeleteRabbitMqVirtualHosts, ProbeConfiguration]
ai_summary: "Deletes RabbitMQ virtual hosts through the management API."
tags: [probes]
canonical_url: /probes/availableProbes/DeleteRabbitMqVirtualHosts/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqVirtualHosts.cs
---

# DeleteRabbitMqVirtualHosts

Deletes RabbitMQ virtual hosts through the management API.

## What it does

Deletes RabbitMQ virtual hosts through the management API. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteRabbitMqVirtualHostsSession
    Probes:
      - Name: DeleteRabbitMqVirtualHostsStep
        Probe: DeleteRabbitMqVirtualHosts
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
        VirtualHostNames: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DeleteRabbitMqVirtualHosts` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqVirtualHosts.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
