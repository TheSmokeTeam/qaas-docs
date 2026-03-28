# PostgreSqlDataBaseTablesTruncate

Truncates the configured PostgreSQL tables in the order they are listed.

> Logical group: SQL maintenance / PostgreSQL tables

> Logical group: SQL maintenance / PostgreSQL tables

## What It Does

Truncates the configured PostgreSQL tables in the order they are listed.

This is useful when scenario state is stored in PostgreSQL and a fast table reset is needed between runs.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: PostgreSqlDataBaseTablesTruncateProbe
        Probe: PostgreSqlDataBaseTablesTruncate
        ProbeConfiguration:
          ConnectionString: Host=localhost;Port=5432;Database=qaas;Username=postgres;Password=postgres;
          CommandTimeoutSeconds: 30
          TableNames:
            - public.outbox
            - public.orders
```

## What This Configuration Does

This probe connects to PostgreSQL and truncates `public.outbox` and `public.orders` with a 30-second timeout.

It clears the table data while leaving the schema intact for the next run.
