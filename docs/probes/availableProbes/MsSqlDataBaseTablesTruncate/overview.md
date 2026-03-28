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
          ConnectionString: Server=localhost;Database=qaas;User Id=sa;Password=Pass@word1;TrustServerCertificate=True;
          CommandTimeoutSeconds: 30
          TableNames:
            - dbo.Outbox
            - dbo.Orders
```

## What This Configuration Does

This probe connects to SQL Server, then truncates `dbo.Outbox` and `dbo.Orders` with a 30-second command timeout.

The listed order is preserved, which is helpful when cleanup should happen in a known sequence.
