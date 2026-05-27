---
id: probes.available.createrabbitmqvirtualhosts.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqVirtualHosts, yaml, scaffold]
summary: "Minimal YAML scaffold for CreateRabbitMqVirtualHosts ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# CreateRabbitMqVirtualHosts Configurations Yaml View

> TL;DR: Minimal YAML scaffold for CreateRabbitMqVirtualHosts ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
ProbeConfiguration:
  Host:
  AllowInvalidServerCertificates:
  ManagementPort:
  ManagementScheme:
  Password:
  Port:
  RequestTimeoutMs:
  UseGlobalDict:
  Username:
  VirtualHost:
  VirtualHosts:
    - Name:
      DefaultQueueType:
      Description:
      ProtectedFromDeletion:
      Tracing:
      Tags: []
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
