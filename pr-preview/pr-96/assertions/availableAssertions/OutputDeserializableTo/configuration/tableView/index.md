# OutputDeserializableTo Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                                  | Type                                                                               | Required | Default | Description                                                                                                                                                                           |
| -------------------------------------------------------------- | ---------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AssertionConfiguration`                                       | `object or string`                                                                 | ✖        |         | Checks that all items in a configured output can be deserialized with a configured deserializer. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.OutputName`                            | `string`                                                                           | ✔        |         | The names of the output who'se items should be deserializable                                                                                                                         |
| `AssertionConfiguration.Deserialize`                           | `object or string`                                                                 | ✔        |         | The deserializer all output items should be deserializable with. Options are all available `QAAS.Base.Serialization` deserializers                                                    |
| `AssertionConfiguration.Deserialize.Deserializer`              | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | ✖        |         | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers                     |
| `AssertionConfiguration.Deserialize.SpecificType`              | `object or string`                                                                 | ✖        |         | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object                                       |
| `AssertionConfiguration.Deserialize.SpecificType.TypeFullName` | `string`                                                                           | ✔        |         | The full name (including path) of the type                                                                                                                                            |
| `AssertionConfiguration.Deserialize.SpecificType.AssemblyName` | `string or null`                                                                   | ✖        |         | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly                                                                     |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/OutputDeserializableTo/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/OutputDeserializableTo/overview/index.md)
