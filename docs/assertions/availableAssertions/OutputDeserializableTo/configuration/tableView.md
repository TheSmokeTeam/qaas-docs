# OutputDeserializableTo Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks that all items in a configured output can be deserialized with a configured deserializer. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.OutputName` | `string` | &#10004 |  | The names of the output who'se items should be deserializable |
| `AssertionConfiguration.Deserialize` | `object or string` | &#10004 |  | The deserializer all output items should be deserializable with. Options are all available `QAAS.Base.Serialization` deserializers |
| `AssertionConfiguration.Deserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `AssertionConfiguration.Deserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `AssertionConfiguration.Deserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `AssertionConfiguration.Deserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
