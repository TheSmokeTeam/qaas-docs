---
id: probes.available.createrabbitmqusers.overview
slug: createrabbitmqusers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, CreateRabbitMqUsers, ProbeConfiguration]
ai_summary: "Creates RabbitMQ users through the management API with the configured credentials and tags."
tags: [probes]
canonical_url: /probes/availableProbes/CreateRabbitMqUsers/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqUsers.cs
---

# CreateRabbitMqUsers

Creates RabbitMQ users through the management API with the configured credentials and tags.

## What it does

Creates RabbitMQ users through the management API with the configured credentials and tags. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: CreateRabbitMqUsersSession
    Probes:
      - Name: CreateRabbitMqUsersStep
        Probe: CreateRabbitMqUsers
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
        Users: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `CreateRabbitMqUsers` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqUsers.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
