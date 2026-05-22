---
id: generators.available.fromlettucedatasources.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromLettuceDataSources, configuration, reference]
summary: "Field-by-field reference for FromLettuceDataSources GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# FromLettuceDataSources — Configuration (table view)

Generated from `generators.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration.Count` | `integer or null or string` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
