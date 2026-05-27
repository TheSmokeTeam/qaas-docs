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

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from multiple DataSources that contain data. `DataSources`: Used. `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `integer or string or null` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
