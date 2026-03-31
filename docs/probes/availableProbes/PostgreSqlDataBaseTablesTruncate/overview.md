# PostgreSqlDataBaseTablesTruncate

Truncates the configured PostgreSQL tables in the order they are listed.

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
          UseGlobalDict: true
          ConnectionString: Host=localhost;Port=5432;Database=qaas;Username=postgres;Password=postgres;
          CommandTimeoutSeconds: 30
          TableNames:
            - public.outbox
            - public.orders
```

## What This Configuration Does

This probe connects to PostgreSQL and truncates `public.outbox` and `public.orders` with a 30-second timeout.

It clears the table data while leaving the schema intact for the next run.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing `ConnectionString` and other shared SQL settings can be resolved from the session-scoped `Sql/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when PostgreSQL cleanup probes should reuse the same SQL connection definition while each probe keeps its own table list.

No recovery alias is written for SQL truncation in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
