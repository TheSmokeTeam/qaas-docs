---
id: generators.available.fromdatasources.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromDataSources, configuration, reference]
summary: "Field-by-field reference for FromDataSources GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# FromDataSources Configurations Table View

> TL;DR: Field-by-field reference for FromDataSources GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from multiple DataSources that contain data. `DataSources`: Used. `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `integer or string or null` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
