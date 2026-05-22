---
id: probes.available.oraclesqldatabasetablestruncate.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OracleSqlDataBaseTablesTruncate, yaml, scaffold]
summary: "Minimal YAML scaffold for OracleSqlDataBaseTablesTruncate ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OracleSqlDataBaseTablesTruncate — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProbeConfiguration:
  ConnectionString:
  TableNames: []
  CommandTimeoutSeconds:
```
