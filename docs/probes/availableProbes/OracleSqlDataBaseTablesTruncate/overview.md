# OracleSqlDataBaseTablesTruncate

Truncates the configured Oracle tables in the order they are listed.

## What It Does

Truncates the configured Oracle tables in the order they are listed.

It serves the same purpose as the other SQL truncate probes, but uses the Oracle provider and connection details.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: OracleSqlDataBaseTablesTruncateProbe
        Probe: OracleSqlDataBaseTablesTruncate
        ProbeConfiguration:
          ConnectionString: User Id=qaas;Password=qaas-password;Data Source=oracle.local:1521/XEPDB1;
          CommandTimeoutSeconds: 30
          TableNames:
            - QAAS_OUTBOX
            - QAAS_ORDERS
```

## What This Configuration Does

This configuration connects to Oracle and truncates `QAAS_OUTBOX` followed by `QAAS_ORDERS`.

It is a database reset step that clears the table contents while keeping the table definitions in place.
