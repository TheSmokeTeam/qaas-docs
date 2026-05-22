---
id: generators.available.jsonschemadraft4.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: [generators/availableGenerators/JsonSchemaDraft4/overview.md]
code_langs: [yaml]
keywords: [generators, JsonSchemaDraft4, configuration, reference]
ai_summary: "Field-by-field reference for JsonSchemaDraft4 GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
tags: [generators]
canonical_url: /generators/availableGenerators/JsonSchemaDraft4/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json
---

# JsonSchemaDraft4 — Configuration (table view)

Generated from `generators.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration.Count` | `integer or string` | &#10004 |  | The Number of generations |
| `GeneratorConfiguration.JsonFieldReplacements` | `array or string` | &#10006 |  | Field injections to generation's Json |
| `GeneratorConfiguration.OutputObjectType` | `integer or string` | &#10006 |  | Output type of generation's Json, parsing the result to a specific type |
| `GeneratorConfiguration.OutputObjectTypeConfiguration` | `object or string` | &#10006 |  | Output type of generation's Json configuration |
| `GeneratorConfiguration.OutputObjectTypeConfiguration.AssemblyName` | `null or string` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `GeneratorConfiguration.OutputObjectTypeConfiguration.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `GeneratorConfiguration.JsonDataSourceName` | `string` | &#10004 |  | DataSource name that contains json |
| `GeneratorConfiguration.Seed` | `integer or null or string` | &#10006 |  | The generation seed, used for random Json Schema value generation |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
