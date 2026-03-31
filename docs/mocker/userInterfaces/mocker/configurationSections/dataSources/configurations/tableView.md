# DataSources Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `DataSources` | `list or string or null` | &#10006 |  | List of data sources that can be used in the rest of the execution. They provide data that can be sent to the tested system or used by the execution itself to perform a multitude of logics. |
| `DataSources[]` | `object or string` | &#10006 |  |  |
| `DataSources[].Generator` | `string` | &#10004 |  | The name of the generator to use |
| `DataSources[].Name` | `string` | &#10004 |  | Name of data source to reference it by (must be unique) |
| `DataSources[].Configuration` | `object or string` | &#10006 |  |  |
| `DataSources[].GeneratorConfiguration` | `object or string or null` | &#10006 |  | Implementation configuration for the generator, the configuration given here is loaded into the provided generator dynamically. |
| `DataSources[].Lazy` | `string or true/false` | &#10006 | False | True to iterate over data lazily |
| `DataSources[].DataSourceNames` | `list or string` | &#10006 |  | Names of data sources to pass to this data source for usage, those data sources dont have to be defined before this data source. |
| `DataSources[].DataSourceNames[]` | `string` | &#10006 |  |  |
| `DataSources[].DataSourcePatterns` | `list or string` | &#10006 |  | Regex patterns of data sources to pass to this data source for usage, those data sources dont have to be defined before this data source. |
| `DataSources[].DataSourcePatterns[]` | `string` | &#10006 |  |  |
| `DataSources[].Deserialize` | `object or string` | &#10006 |  | Deserialize to use on the generated data |
| `DataSources[].Deserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `DataSources[].Deserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `DataSources[].Deserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `DataSources[].Deserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `DataSources[].Serialize` | `object or string` | &#10006 |  | Serialize to use on the generated data |
| `DataSources[].Serialize.Serializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers |
