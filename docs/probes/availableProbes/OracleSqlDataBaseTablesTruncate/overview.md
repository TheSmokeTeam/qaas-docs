---
id: probes.available.oraclesqldatabasetablestruncate.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OracleSqlDataBaseTablesTruncate, ProbeConfiguration]
summary: "Truncates the configured Oracle tables in the order they are listed."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\SqlProbes\OracleSqlDataBaseTablesTruncate.cs -->

# OracleSqlDataBaseTablesTruncate

Truncates the configured Oracle tables in the order they are listed.

## What it does

Truncates the configured Oracle tables in the order they are listed. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OracleSqlDataBaseTablesTruncateSession
    Probes:
      - Name: OracleSqlDataBaseTablesTruncateStep
        Probe: OracleSqlDataBaseTablesTruncate
        ProbeConfiguration:
        ConnectionString:
        TableNames: []
        CommandTimeoutSeconds:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OracleSqlDataBaseTablesTruncate` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\SqlProbes\OracleSqlDataBaseTablesTruncate.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
