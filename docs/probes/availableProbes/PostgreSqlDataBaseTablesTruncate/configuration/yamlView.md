---
id: probes.available.postgresqldatabasetablestruncate.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/PostgreSqlDataBaseTablesTruncate/overview.md]
code_langs: [yaml]
keywords: [probes, PostgreSqlDataBaseTablesTruncate, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for PostgreSqlDataBaseTablesTruncate ProbeConfiguration — copy, fill the blanks, drop into a Session step."
tags: [probes]
canonical_url: /probes/availableProbes/PostgreSqlDataBaseTablesTruncate/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# PostgreSqlDataBaseTablesTruncate — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProbeConfiguration:
  ConnectionString:
  TableNames: []
  CommandTimeoutSeconds:
```
