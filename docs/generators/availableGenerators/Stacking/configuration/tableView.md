---
id: generators.available.stacking.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, Stacking, configuration, reference]
summary: "Field-by-field reference for Stacking GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# Stacking Configurations Table View

> TL;DR: Field-by-field reference for Stacking GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from multiple DataSources by configured items per generator. `DataSources`: Used. `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `integer or string or null` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.LoopFinishedGenerators` | `string or true/false` | &#10006 | False | When true, generators will restart when there are no more items in them |
| `GeneratorConfiguration.ItemsPerGenerator` | `list or string` | &#10004 |  | The number of items to generate out of the given data sources in turn |
| `GeneratorConfiguration.ItemsPerGenerator[]` | `integer or string` | &#10006 |  |  |

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
