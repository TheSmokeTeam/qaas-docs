---
id: probes.available.deleterabbitmqpermissions.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteRabbitMqPermissions, yaml, scaffold]
summary: "Minimal YAML scaffold for DeleteRabbitMqPermissions ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# DeleteRabbitMqPermissions — Configuration (YAML scaffold)

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
  Permissions: []
```
