---
id: probes.available.uploadrabbitmqdefinitions.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, UploadRabbitMqDefinitions, ProbeConfiguration]
summary: "Uploads a previously captured RabbitMQ definitions file back into the broker through the management API."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\UploadRabbitMqDefinitions.cs -->

# UploadRabbitMqDefinitions

Uploads a previously captured RabbitMQ definitions file back into the broker through the management API.

## What it does

Uploads a previously captured RabbitMQ definitions file back into the broker through the management API. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: UploadRabbitMqDefinitionsSession
    Probes:
      - Name: UploadRabbitMqDefinitionsStep
        Probe: UploadRabbitMqDefinitions
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
        DefinitionsJson:
        DefinitionsFilePath:
        VirtualHostName:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `UploadRabbitMqDefinitions` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\UploadRabbitMqDefinitions.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
