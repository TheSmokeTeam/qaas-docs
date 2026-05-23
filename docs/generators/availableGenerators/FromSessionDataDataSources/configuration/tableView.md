---
id: generators.available.fromsessiondatadatasources.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromSessionDataDataSources, configuration, reference]
summary: "Field-by-field reference for FromSessionDataDataSources GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# FromSessionDataDataSources Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `list or string or null` | &#10006 |  |  |
| `GeneratorConfiguration[]` | `object or string` | &#10006 |  | Supports generating data from multiple DataSources that contain SessionData files. `DataSources`: All Used. Must all be serialized (`byte[]`) `SessionData` items. `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration[].SessionName` | `string` | &#10004 |  | name of the session to load the outputs/inputs of as part of the generated data |
| `GeneratorConfiguration[].CommunicationDataList` | `list or string` | &#10004 |  | All of the communnication data items in the given session data to load as part of the generated data by the order listed here |
| `GeneratorConfiguration[].CommunicationDataList[]` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration[].CommunicationDataList[].Name` | `string` | &#10004 |  | The name of the communication data in the session data to generate |
| `GeneratorConfiguration[].CommunicationDataList[].Type` | `one of [Input / Output]` | &#10004 |  | The type of the communication data to generate. Options: [ `Input` -  an input communication data from the Inputs list in the SessionData structure / `Output` - an output communication data from the Outputs list in the SessionData structure ] |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
