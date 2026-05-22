---
id: probes.available.mssqldatabasetablestruncate.overview
slug: mssqldatabasetablestruncate
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, MsSqlDataBaseTablesTruncate, ProbeConfiguration]
ai_summary: "Truncates the configured Microsoft SQL Server tables in the order they are listed."
tags: [probes]
canonical_url: /probes/availableProbes/MsSqlDataBaseTablesTruncate/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\SqlProbes\MsSqlDataBaseTablesTruncate.cs
---

# MsSqlDataBaseTablesTruncate

Truncates the configured Microsoft SQL Server tables in the order they are listed.

## What it does

Truncates the configured Microsoft SQL Server tables in the order they are listed. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: MsSqlDataBaseTablesTruncateSession
    Probes:
      - Name: MsSqlDataBaseTablesTruncateStep
        Probe: MsSqlDataBaseTablesTruncate
        ProbeConfiguration:
        ConnectionString:
        TableNames: []
        CommandTimeoutSeconds:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `MsSqlDataBaseTablesTruncate` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\SqlProbes\MsSqlDataBaseTablesTruncate.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
