---
id: probes.available.upsertrabbitmqpermissions.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, UpsertRabbitMqPermissions, ProbeConfiguration]
summary: "Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\UpsertRabbitMqPermissions.cs -->

# UpsertRabbitMqPermissions

Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API.

## What it does

Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: UpsertRabbitMqPermissionsSession
    Probes:
      - Name: UpsertRabbitMqPermissionsStep
        Probe: UpsertRabbitMqPermissions
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
| **YAML key** | `UpsertRabbitMqPermissions` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\UpsertRabbitMqPermissions.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
