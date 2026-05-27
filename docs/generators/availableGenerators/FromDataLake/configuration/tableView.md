---
id: generators.available.fromdatalake.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromDataLake, configuration, reference]
summary: "Field-by-field reference for FromDataLake GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# FromDataLake Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from data lake. `DataSources`: Not used. `SessionData`: Not used. |
| `GeneratorConfiguration.Password` | `string` | &#10004 |  | The password for connecting to the trino server |
| `GeneratorConfiguration.Query` | `string` | &#10004 |  | The query to execute against the datalake |
| `GeneratorConfiguration.Username` | `string` | &#10004 |  | The username for connecting to the trino server |
| `GeneratorConfiguration.Catalog` | `string` | &#10006 | `hive` | The datalake catalog to query |
| `GeneratorConfiguration.ClientTag` | `string` | &#10006 | `qaas` | The client tag to use for connection |
| `GeneratorConfiguration.TrinoServerUri` | `string` | &#10006 | `http://localhost:8080` | The trino server to connnect to |
| `GeneratorConfiguration.ColumnsToIgnore` | `list or string` | &#10006 | `[]` | The columns to ignore in the query results, if no columns are given doesn't ignore any columns |
| `GeneratorConfiguration.ColumnsToIgnore[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
