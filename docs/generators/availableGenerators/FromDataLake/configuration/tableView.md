---
id: generators.available.fromdatalake.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: [generators/availableGenerators/FromDataLake/overview.md]
code_langs: [yaml]
keywords: [generators, FromDataLake, configuration, reference]
ai_summary: "Field-by-field reference for FromDataLake GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
tags: [generators]
canonical_url: /generators/availableGenerators/FromDataLake/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json
---

# FromDataLake — Configuration (table view)

Generated from `generators.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration.TrinoServerUri` | `string` | &#10006 | http://localhost:8080 | The trino server to connnect to |
| `GeneratorConfiguration.Username` | `string` | &#10004 |  | The username for connecting to the trino server |
| `GeneratorConfiguration.Password` | `string` | &#10004 |  | The password for connecting to the trino server |
| `GeneratorConfiguration.ClientTag` | `string` | &#10006 | qaas | The client tag to use for connection |
| `GeneratorConfiguration.Catalog` | `string` | &#10006 | hive | The datalake catalog to query |
| `GeneratorConfiguration.Query` | `string` | &#10004 |  | The query to execute against the datalake |
| `GeneratorConfiguration.ColumnsToIgnore` | `array or string` | &#10006 | `[]` | The columns to ignore in the query results, if no columns are given doesn't ignore any columns |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
