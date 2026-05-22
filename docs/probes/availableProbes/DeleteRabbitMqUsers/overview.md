---
id: probes.available.deleterabbitmqusers.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteRabbitMqUsers, ProbeConfiguration]
summary: "Deletes RabbitMQ users through the management API."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqUsers.cs -->

# DeleteRabbitMqUsers

Deletes RabbitMQ users through the management API.

## What it does

Deletes RabbitMQ users through the management API. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteRabbitMqUsersSession
    Probes:
      - Name: DeleteRabbitMqUsersStep
        Probe: DeleteRabbitMqUsers
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
        Usernames: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DeleteRabbitMqUsers` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqUsers.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
