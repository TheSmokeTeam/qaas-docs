---
id: probes.available.oraclesqldatabasetablestruncate.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/OracleSqlDataBaseTablesTruncate/overview.md]
code_langs: [yaml]
keywords: [probes, OracleSqlDataBaseTablesTruncate, configuration, reference]
ai_summary: "Field-by-field reference for OracleSqlDataBaseTablesTruncate ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
tags: [probes]
canonical_url: /probes/availableProbes/OracleSqlDataBaseTablesTruncate/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# OracleSqlDataBaseTablesTruncate — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `ProbeConfiguration.TableNames` | `array or string` | &#10004 |  | The names of all the tables to truncate, they will be truncated by the order they are given in this list |
| `ProbeConfiguration.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute the truncate command and generating an error |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
