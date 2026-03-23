# JsonSchemaDraft4 Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `Object | String` | &#10006 |  | Supports generating data from Json (Schema) data sources. `DataSources`: Used, should only be a single one and must  contain data deserialized into Json (JsonNode). `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `Integer | String` | &#10004 |  | The Number of generations |
| `GeneratorConfiguration.JsonDataSourceName` | `String` | &#10004 |  | DataSource name that contains json |
| `GeneratorConfiguration.OutputObjectType` | `enum [Json / Binary / ProtobufMessage / Xml]` | &#10006 |  | Output type of generation's Json, parsing the result to a specific type |
| `GeneratorConfiguration.Seed` | `Integer | Null | String` | &#10006 |  | The generation seed, used for random Json Schema value generation |
| `GeneratorConfiguration.JsonFieldReplacements` | `Array | String` | &#10006 |  | Field injections to generation's Json |
| `GeneratorConfiguration.JsonFieldReplacements[]` | `Object | String` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].Path` | `String` | &#10004 |  | The path (JSONPath query language Feb 2024, by Stefan Gossner) of the field to inject to |
| `GeneratorConfiguration.JsonFieldReplacements[].ValueType` | `enum [Null / FromDataSource / DateTime / UnixEpochTime / String / Boolean / Integer / Double / ByteArray]` | &#10006 |  | The type of static field injection to use |
| `GeneratorConfiguration.JsonFieldReplacements[].Boolean` | `Object | String` | &#10006 |  | The value of the field if the type is 'Boolean' |
| `GeneratorConfiguration.JsonFieldReplacements[].Boolean.Value` | `Boolean | String` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].ByteArray` | `Object | String` | &#10006 |  | The value of the field if the type is 'ByteArray' |
| `GeneratorConfiguration.JsonFieldReplacements[].ByteArray.Value` | `String` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime` | `Object | String` | &#10006 |  | The date-time field configuration |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Day` | `Integer | Null | String` | &#10006 |  | Constant Day of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.DayOffset` | `Integer | String` | &#10006 | 0 | Day offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Format` | `String` | &#10006 | o | Format of the date time (default ISO 8601 without Tim Zone) |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Hour` | `Integer | Null | String` | &#10006 |  | Constant Hour of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.HourOffset` | `Integer | String` | &#10006 | 0 | Hour offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Millisecond` | `Integer | Null | String` | &#10006 |  | Constant Millisecond of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.MillisecondOffset` | `Integer | String` | &#10006 | 0 | Millisecond offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Minute` | `Integer | Null | String` | &#10006 |  | Constant Minute of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.MinuteOffset` | `Integer | String` | &#10006 | 0 | Minute offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Month` | `Integer | Null | String` | &#10006 |  | Constant Month of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Second` | `Integer | Null | String` | &#10006 |  | Constant Second of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.SecondOffset` | `Integer | String` | &#10006 | 0 | Second offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.TimeZone` | `Null | String` | &#10006 |  | Timezone of the date time (default UTC) |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Year` | `Integer | Null | String` | &#10006 |  | Constant Year of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].Double` | `Object | String` | &#10006 |  | The value of the field if the type is 'Double' |
| `GeneratorConfiguration.JsonFieldReplacements[].Double.Value` | `Number | String` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].FromDataSource` | `Object | String` | &#10006 |  | The generation field configuration |
| `GeneratorConfiguration.JsonFieldReplacements[].FromDataSource.Name` | `String` | &#10004 |  | The name of the data source to use for the value of the field |
| `GeneratorConfiguration.JsonFieldReplacements[].FromDataSource.OutOfRangePolicy` | `enum [Null / Loop]` | &#10006 |  | The policy to use if the data source is out of range |
| `GeneratorConfiguration.JsonFieldReplacements[].Integer` | `Object | String` | &#10006 |  | The value of the field if the type is 'Integer' |
| `GeneratorConfiguration.JsonFieldReplacements[].Integer.Value` | `Integer | String` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].String` | `Object | String` | &#10006 |  | The value of the field if the type is 'String' |
| `GeneratorConfiguration.JsonFieldReplacements[].String.Value` | `String` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime` | `Object | String` | &#10006 |  | The unix epoch time field configuration |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Day` | `Integer | Null | String` | &#10006 |  | Constant Day of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.DayOffset` | `Integer | String` | &#10006 | 0 | Day offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Hour` | `Integer | Null | String` | &#10006 |  | Constant Hour of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.HourOffset` | `Integer | String` | &#10006 | 0 | Hour offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Millisecond` | `Integer | Null | String` | &#10006 |  | Constant Millisecond of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.MillisecondOffset` | `Integer | String` | &#10006 | 0 | Millisecond offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Minute` | `Integer | Null | String` | &#10006 |  | Constant Minute of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.MinuteOffset` | `Integer | String` | &#10006 | 0 | Minute offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Month` | `Integer | Null | String` | &#10006 |  | Constant Month of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Second` | `Integer | Null | String` | &#10006 |  | Constant Second of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.SecondOffset` | `Integer | String` | &#10006 | 0 | Second offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.UnixEpochObjectType` | `enum [Long / String]` | &#10006 |  | Epoch Unix Time Object Representation |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.UnixEpochScaleType` | `enum [Seconds / Milliseconds]` | &#10006 |  | Epoch Unix Time Scale Representation |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Year` | `Integer | Null | String` | &#10006 |  | Constant Year of the date time |
| `GeneratorConfiguration.OutputObjectTypeConfiguration` | `Object | String` | &#10006 |  | Output type of generation's Json configuration |
| `GeneratorConfiguration.OutputObjectTypeConfiguration.TypeFullName` | `String` | &#10004 |  | The full name (including path) of the type |
| `GeneratorConfiguration.OutputObjectTypeConfiguration.AssemblyName` | `Null | String` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
