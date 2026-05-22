---
id: probes.available.oraclesqldatabasetablestruncate.overview
slug: oraclesqldatabasetablestruncate
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, OracleSqlDataBaseTablesTruncate, ProbeConfiguration]
ai_summary: "Truncates the configured Oracle tables in the order they are listed."
tags: [probes]
canonical_url: /probes/availableProbes/OracleSqlDataBaseTablesTruncate/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\SqlProbes\OracleSqlDataBaseTablesTruncate.cs
---

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
