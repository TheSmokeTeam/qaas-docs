# Stubs Configurations Table View

| Property Path | Type | Required | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| `Stubs` | `array` | &#10006; |  | List of configured transaction stubs |
| `Stubs[]` | `object` | &#10006; |  | One configured transaction stub |
| `Stubs[].Name` | `string` | &#10004; |  | Unique stub name |
| `Stubs[].Processor` | `string` | &#10004; |  | Transaction processor hook name |
| `Stubs[].DataSourceNames` | `array` | &#10006; | `[]` | Data sources passed into the processor |
| `Stubs[].DataSourceNames[]` | `string` | &#10006; |  | One referenced data-source name |
| `Stubs[].ProcessorConfiguration` | `object` | &#10006; |  | Processor-specific configuration loaded dynamically into the selected hook |
| `Stubs[].RequestBodyDeserialization` | `object` | &#10006; |  | Deserializer applied to the request body before processor execution |
| `Stubs[].RequestBodyDeserialization.Deserializer` | `enum` | &#10006; |  | Deserializer type |
| `Stubs[].RequestBodyDeserialization.SpecificType` | `object` | &#10006; |  | Deserialize the request body to a specific .NET type |
| `Stubs[].RequestBodyDeserialization.SpecificType.TypeFullName` | `string` | &#10004; |  | Full type name to deserialize into |
| `Stubs[].RequestBodyDeserialization.SpecificType.AssemblyName` | `string` | &#10006; |  | Assembly containing the type |
| `Stubs[].ResponseBodySerialization` | `object` | &#10006; |  | Serializer applied to the response body after processor execution |
| `Stubs[].ResponseBodySerialization.Serializer` | `enum` | &#10006; |  | Serializer type |
