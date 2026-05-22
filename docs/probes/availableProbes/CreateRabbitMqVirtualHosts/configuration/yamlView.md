---
id: probes.available.createrabbitmqvirtualhosts.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/CreateRabbitMqVirtualHosts/overview.md]
code_langs: [yaml]
keywords: [probes, CreateRabbitMqVirtualHosts, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for CreateRabbitMqVirtualHosts ProbeConfiguration — copy, fill the blanks, drop into a Session step."
tags: [probes]
canonical_url: /probes/availableProbes/CreateRabbitMqVirtualHosts/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# CreateRabbitMqVirtualHosts — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
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
