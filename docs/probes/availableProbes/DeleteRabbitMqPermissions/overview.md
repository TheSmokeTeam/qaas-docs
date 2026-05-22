---
id: probes.available.deleterabbitmqpermissions.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteRabbitMqPermissions, ProbeConfiguration]
summary: "Deletes RabbitMQ user permissions in one or more virtual hosts through the management API."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqPermissions.cs -->

# DeleteRabbitMqPermissions

Deletes RabbitMQ user permissions in one or more virtual hosts through the management API.

## What it does

Deletes RabbitMQ user permissions in one or more virtual hosts through the management API. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteRabbitMqPermissionsSession
    Probes:
      - Name: DeleteRabbitMqPermissionsStep
        Probe: DeleteRabbitMqPermissions
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
        Permissions: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DeleteRabbitMqPermissions` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqPermissions.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
