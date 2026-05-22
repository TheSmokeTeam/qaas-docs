---
id: probes.available.postgresqldatabasetablestruncate.overview
slug: postgresqldatabasetablestruncate
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, PostgreSqlDataBaseTablesTruncate, ProbeConfiguration]
ai_summary: "Truncates the configured PostgreSQL tables in the order they are listed."
tags: [probes]
canonical_url: /probes/availableProbes/PostgreSqlDataBaseTablesTruncate/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\SqlProbes\PostgreSqlDataBaseTablesTruncate.cs
---

# PostgreSqlDataBaseTablesTruncate

Truncates the configured PostgreSQL tables in the order they are listed.

## What it does

Truncates the configured PostgreSQL tables in the order they are listed. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: PostgreSqlDataBaseTablesTruncateSession
    Probes:
      - Name: PostgreSqlDataBaseTablesTruncateStep
        Probe: PostgreSqlDataBaseTablesTruncate
        ProbeConfiguration:
        ConnectionString:
        TableNames: []
        CommandTimeoutSeconds:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `PostgreSqlDataBaseTablesTruncate` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\SqlProbes\PostgreSqlDataBaseTablesTruncate.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
