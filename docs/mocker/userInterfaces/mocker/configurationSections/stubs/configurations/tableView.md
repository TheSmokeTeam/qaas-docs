<!-- generated hash:2b06ca30ae3b sources:mocker-family, Stubs, table-view -->

# Stubs Configurations Table View

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
