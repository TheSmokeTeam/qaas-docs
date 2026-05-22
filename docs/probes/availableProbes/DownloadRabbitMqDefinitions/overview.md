---
id: probes.available.downloadrabbitmqdefinitions.overview
slug: downloadrabbitmqdefinitions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DownloadRabbitMqDefinitions, ProbeConfiguration]
ai_summary: "Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused."
tags: [probes]
canonical_url: /probes/availableProbes/DownloadRabbitMqDefinitions/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DownloadRabbitMqDefinitions.cs
---

# DownloadRabbitMqDefinitions

Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused.

## What it does

Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DownloadRabbitMqDefinitionsSession
    Probes:
      - Name: DownloadRabbitMqDefinitionsStep
        Probe: DownloadRabbitMqDefinitions
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
        DefinitionsFilePath:
        VirtualHostName:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DownloadRabbitMqDefinitions` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DownloadRabbitMqDefinitions.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
