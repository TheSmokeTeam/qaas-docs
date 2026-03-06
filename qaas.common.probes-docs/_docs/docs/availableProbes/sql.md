# SQL

## Available Probes

- `MsSqlDataBaseTablesTruncate`
- `PostgreSqlDataBaseTablesTruncate`
- `OracleSqlDataBaseTablesTruncate`

## Purpose

These probes truncate tables in the configured order. They are useful for resetting database state between runs without rebuilding the schema.

## Configuration Fields

| Field | Required | Description |
|---|---|---|
| `ConnectionString` | yes | Database connection string. |
| `TableNames` | yes | Tables to truncate, in the order provided. |
| `CommandTimeoutSeconds` | no | Timeout for the truncate command. Default: `30`. |

Choose the probe that matches the target database engine because each implementation uses the database-specific truncate flow.
