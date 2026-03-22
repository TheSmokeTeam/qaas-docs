<!-- generated hash:9b51332f4404 sources:mocker-family, Stubs, table-view -->

# Stubs Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Stubs` | `Array | String` | &#10006 |  | List of transaction stubs that can be used for server actions.They provide processing functionality to exercise transaction data. |
| `Stubs[]` | `Object | String` | &#10006 |  |  |
| `Stubs[].Name` | `String` | &#10004 |  | Name of data source to reference it by (must be unique) |
| `Stubs[].Processor` | `String` | &#10004 |  | The name of the processor to use |
| `Stubs[].ProcessorConfiguration` | `Null | Object | String` | &#10006 |  | Implementation configuration for the processor, the configuration given here is loaded into the provided processor dynamically. |
| `Stubs[].DataSourceNames` | `Array | String` | &#10006 |  | Names of data sources to pass to this data source for usage, those data sources dont have to be defined before this data source. |
| `Stubs[].DataSourceNames[]` | `String` | &#10006 |  |  |
| `Stubs[].RequestBodyDeserialization` | `Object | String` | &#10006 |  | Deserialize to use on the request body |
| `Stubs[].RequestBodyDeserialization.Deserializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Stubs[].RequestBodyDeserialization.SpecificType` | `Object | String` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Stubs[].RequestBodyDeserialization.SpecificType.TypeFullName` | `String` | &#10004 |  | The full name (including path) of the type |
| `Stubs[].RequestBodyDeserialization.SpecificType.AssemblyName` | `Null | String` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Stubs[].ResponseBodySerialization` | `Object | String` | &#10006 |  | Serialize to use on the response body |
| `Stubs[].ResponseBodySerialization.Serializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers |
