---
id: probes.available.mssqldatabasetablestruncate.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, MsSqlDataBaseTablesTruncate, configuration, reference]
summary: "Field-by-field reference for MsSqlDataBaseTablesTruncate ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# MsSqlDataBaseTablesTruncate Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `ProbeConfiguration.CommandTimeoutSeconds` | `integer or string` | &#10006 | `30` | The wait time (in seconds) before terminating the attempt to execute the truncate command and generating an error |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | `False` | When true, missing SQL probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
| `ProbeConfiguration.TableNames` | `list or string` | &#10004 |  | The names of all the tables to truncate, they will be truncated by the order they are given in this list |
| `ProbeConfiguration.TableNames[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
