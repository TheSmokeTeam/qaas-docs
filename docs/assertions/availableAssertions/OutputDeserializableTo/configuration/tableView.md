---
id: assertions.available.outputdeserializableto.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, OutputDeserializableTo, configuration, reference]
summary: "Field-by-field reference for OutputDeserializableTo AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# OutputDeserializableTo — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.OutputName` | `string` | &#10004 |  | The names of the output who'se items should be deserializable |
| `AssertionConfiguration.Deserialize` | `object or string` | &#10004 |  | The deserializer all output items should be deserializable with. Options are all available `QAAS.Base.Serialization` deserializers |
| `AssertionConfiguration.Deserialize.Deserializer` | `integer or string` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `AssertionConfiguration.Deserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `AssertionConfiguration.Deserialize.SpecificType.AssemblyName` | `null or string` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `AssertionConfiguration.Deserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
