---
id: mocker.userinterfaces.mocker.configurationsections.stubs.configurations.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, stubs, configurations, tableview]
summary: "Stubs Configurations Table View"
---
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->

# Stubs Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Stubs` | `list or string` | &#10006 |  | List of transaction stubs that can be used for server actions.They provide processing functionality to exercise transaction data. |
| `Stubs[]` | `object or string` | &#10006 |  |  |
| `Stubs[].Name` | `string` | &#10004 |  | Name of data source to reference it by (must be unique) |
| `Stubs[].Processor` | `string` | &#10004 |  | The name of the processor to use |
| `Stubs[].ProcessorConfiguration` | `object or string or null` | &#10006 |  | Implementation configuration for the processor, the configuration given here is loaded into the provided processor dynamically. |
| `Stubs[].DataSourceNames` | `list or string` | &#10006 |  | Names of data sources to pass to this data source for usage, those data sources dont have to be defined before this data source. |
| `Stubs[].DataSourceNames[]` | `string` | &#10006 |  |  |
| `Stubs[].RequestBodyDeserialization` | `object or string` | &#10006 |  | Deserialize to use on the request body |
| `Stubs[].RequestBodyDeserialization.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Stubs[].RequestBodyDeserialization.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Stubs[].RequestBodyDeserialization.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `Stubs[].RequestBodyDeserialization.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Stubs[].ResponseBodySerialization` | `object or string` | &#10006 |  | Serialize to use on the response body |
| `Stubs[].ResponseBodySerialization.Serializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
