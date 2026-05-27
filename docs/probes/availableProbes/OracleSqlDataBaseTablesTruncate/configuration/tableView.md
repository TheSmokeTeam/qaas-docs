---
id: probes.available.oraclesqldatabasetablestruncate.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OracleSqlDataBaseTablesTruncate, configuration, reference]
summary: "Field-by-field reference for OracleSqlDataBaseTablesTruncate ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---

# OracleSqlDataBaseTablesTruncate Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `ProbeConfiguration.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute the truncate command and generating an error |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing SQL probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
| `ProbeConfiguration.TableNames` | `list or string` | &#10004 |  | The names of all the tables to truncate, they will be truncated by the order they are given in this list |
| `ProbeConfiguration.TableNames[]` | `string` | &#10006 |  |  |
