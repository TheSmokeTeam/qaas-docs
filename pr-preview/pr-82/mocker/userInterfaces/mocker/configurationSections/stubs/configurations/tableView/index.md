# Stubs Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                                  | Type                                                                               | Required | Default | Description                                                                                                                                                       |
| -------------------------------------------------------------- | ---------------------------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Stubs`                                                        | `list or string`                                                                   | ✖        |         | List of transaction stubs that can be used for server actions.They provide processing functionality to exercise transaction data.                                 |
| `Stubs[]`                                                      | `object or string`                                                                 | ✖        |         |                                                                                                                                                                   |
| `Stubs[].Name`                                                 | `string`                                                                           | ✔        |         | Name of data source to reference it by (must be unique)                                                                                                           |
| `Stubs[].Processor`                                            | `string`                                                                           | ✔        |         | The name of the processor to use                                                                                                                                  |
| `Stubs[].ProcessorConfiguration`                               | `object or string or null`                                                         | ✖        |         | Implementation configuration for the processor, the configuration given here is loaded into the provided processor dynamically.                                   |
| `Stubs[].DataSourceNames`                                      | `list or string`                                                                   | ✖        |         | Names of data sources to pass to this data source for usage, those data sources dont have to be defined before this data source.                                  |
| `Stubs[].DataSourceNames[]`                                    | `string`                                                                           | ✖        |         |                                                                                                                                                                   |
| `Stubs[].RequestBodyDeserialization`                           | `object or string`                                                                 | ✖        |         | Deserialize to use on the request body                                                                                                                            |
| `Stubs[].RequestBodyDeserialization.Deserializer`              | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | ✖        |         | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Stubs[].RequestBodyDeserialization.SpecificType`              | `object or string`                                                                 | ✖        |         | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object                   |
| `Stubs[].RequestBodyDeserialization.SpecificType.TypeFullName` | `string`                                                                           | ✔        |         | The full name (including path) of the type                                                                                                                        |
| `Stubs[].RequestBodyDeserialization.SpecificType.AssemblyName` | `string or null`                                                                   | ✖        |         | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly                                                 |
| `Stubs[].ResponseBodySerialization`                            | `object or string`                                                                 | ✖        |         | Serialize to use on the response body                                                                                                                             |
| `Stubs[].ResponseBodySerialization.Serializer`                 | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | ✖        |         | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers         |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/configurations/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md)
