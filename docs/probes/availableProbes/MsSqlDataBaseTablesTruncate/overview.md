# MsSqlDataBaseTablesTruncate

Truncates the configured Microsoft SQL Server tables in the order they are listed.

## What It Does

Truncates the configured SQL Server tables in the order they are listed.

This is useful when a scenario needs a fast relational cleanup step and the target tables are safe to truncate directly.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: MsSqlDataBaseTablesTruncateProbe
        Probe: MsSqlDataBaseTablesTruncate
        ProbeConfiguration:
          UseGlobalDict: true
          ConnectionString: Server=localhost;Database=qaas;User Id=sa;Password=Pass@word1;TrustServerCertificate=True;
          CommandTimeoutSeconds: 30
          TableNames:
            - dbo.Outbox
            - dbo.Orders
```

## What This Configuration Does

This probe connects to SQL Server, then truncates `dbo.Outbox` and `dbo.Orders` with a 30-second command timeout.

The listed order is preserved, which is helpful when cleanup should happen in a known sequence.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing `ConnectionString` and other shared SQL settings can be resolved from the session-scoped `Sql/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when database cleanup probes should reuse the same SQL connection definition while each probe keeps its own table list.

No recovery alias is written for SQL truncation in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
