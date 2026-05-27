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

> TL;DR — Truncates the configured Oracle tables in the order they are listed.

## When to use {: #when-to-use}

Truncates the configured Oracle tables in the order they are listed.

It serves the same purpose as the other SQL truncate probes, but uses the Oracle provider and connection details.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OracleSqlDataBaseTablesTruncateProbe
        Probe: OracleSqlDataBaseTablesTruncate
        ProbeConfiguration:
          UseGlobalDict: true
          ConnectionString: User Id=qaas;Password=qaas-password;Data Source=oracle.local:1521/XEPDB1;
          CommandTimeoutSeconds: 30
          TableNames:
            - QAAS_OUTBOX
            - QAAS_ORDERS
```

## Realistic example {: #realistic-example}

This configuration connects to Oracle and truncates `QAAS_OUTBOX` followed by `QAAS_ORDERS`.

It is a database reset step that clears the table contents while keeping the table definitions in place.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing `ConnectionString` and other shared SQL settings can be resolved from the session-scoped `Sql/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when Oracle cleanup probes should reuse the same SQL connection definition while each probe keeps its own table list.

No recovery alias is written for SQL truncation in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Probes](../../index.md)
