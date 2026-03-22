# DataSources Configurations Table View

| Property Path | Type | Required | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| `DataSources` | `array` | &#10006; |  | List of configured data sources |
| `DataSources[]` | `object` | &#10006; |  | One configured data source |
| `DataSources[].Name` | `string` | &#10004; |  | Unique data-source name |
| `DataSources[].Generator` | `string` | &#10004; |  | Generator hook name |
| `DataSources[].Lazy` | `boolean` | &#10006; | `false` | Generate data lazily on every `Retrieve()` call |
| `DataSources[].DataSourceNames` | `array` | &#10006; | `[]` | Explicit data-source dependencies |
| `DataSources[].DataSourceNames[]` | `string` | &#10006; |  | One referenced data-source name |
| `DataSources[].DataSourcePatterns` | `array` | &#10006; | `[]` | Regex patterns used to match data-source dependencies |
| `DataSources[].DataSourcePatterns[]` | `string` | &#10006; |  | One dependency pattern |
| `DataSources[].Serialize` | `object` | &#10006; |  | Serializer used on generated data |
| `DataSources[].Serialize.Serializer` | `enum` | &#10006; |  | Serializer type |
| `DataSources[].Deserialize` | `object` | &#10006; |  | Deserializer used on generated data |
| `DataSources[].Deserialize.Deserializer` | `enum` | &#10006; |  | Deserializer type |
| `DataSources[].Deserialize.SpecificType` | `object` | &#10006; |  | Deserialize to a specific .NET type |
| `DataSources[].Deserialize.SpecificType.TypeFullName` | `string` | &#10004; |  | Full type name to deserialize into |
| `DataSources[].Deserialize.SpecificType.AssemblyName` | `string` | &#10006; |  | Assembly containing the type |
| `DataSources[].GeneratorConfiguration` | `object` | &#10006; |  | Generator-specific configuration loaded dynamically into the selected hook |
