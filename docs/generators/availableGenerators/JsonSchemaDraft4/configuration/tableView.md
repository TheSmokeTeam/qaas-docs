<!-- generated hash:3dc671103cd0 sources:mocker-family, JsonSchemaDraft4, table-view -->

# JsonSchemaDraft4 Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from Json (Schema) data sources. `DataSources`: Used, should only be a single one and must  contain data deserialized into Json (JsonNode). `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `integer or string` | &#10004 |  | The Number of generations |
| `GeneratorConfiguration.JsonDataSourceName` | `string` | &#10004 |  | DataSource name that contains json |
| `GeneratorConfiguration.OutputObjectType` | `one of [Json / Binary / ProtobufMessage / Xml]` | &#10006 |  | Output type of generation's Json, parsing the result to a specific type |
| `GeneratorConfiguration.Seed` | `integer or string or null` | &#10006 |  | The generation seed, used for random Json Schema value generation |
| `GeneratorConfiguration.JsonFieldReplacements` | `list or string` | &#10006 |  | Field injections to generation's Json |
| `GeneratorConfiguration.JsonFieldReplacements[]` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].Path` | `string` | &#10004 |  | The path (JSONPath query language Feb 2024, by Stefan Gossner) of the field to inject to |
| `GeneratorConfiguration.JsonFieldReplacements[].ValueType` | `one of [Null / FromDataSource / DateTime / UnixEpochTime / String / Boolean / Integer / Double / ByteArray]` | &#10006 |  | The type of static field injection to use |
| `GeneratorConfiguration.JsonFieldReplacements[].Boolean` | `object or string` | &#10006 |  | The value of the field if the type is 'Boolean' |
| `GeneratorConfiguration.JsonFieldReplacements[].Boolean.Value` | `string or true/false` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].ByteArray` | `object or string` | &#10006 |  | The value of the field if the type is 'ByteArray' |
| `GeneratorConfiguration.JsonFieldReplacements[].ByteArray.Value` | `string` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime` | `object or string` | &#10006 |  | The date-time field configuration |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Day` | `integer or string or null` | &#10006 |  | Constant Day of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.DayOffset` | `integer or string` | &#10006 | 0 | Day offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Format` | `string` | &#10006 | o | Format of the date time (default ISO 8601 without Tim Zone) |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Hour` | `integer or string or null` | &#10006 |  | Constant Hour of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.HourOffset` | `integer or string` | &#10006 | 0 | Hour offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Millisecond` | `integer or string or null` | &#10006 |  | Constant Millisecond of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.MillisecondOffset` | `integer or string` | &#10006 | 0 | Millisecond offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Minute` | `integer or string or null` | &#10006 |  | Constant Minute of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.MinuteOffset` | `integer or string` | &#10006 | 0 | Minute offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Month` | `integer or string or null` | &#10006 |  | Constant Month of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Second` | `integer or string or null` | &#10006 |  | Constant Second of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.SecondOffset` | `integer or string` | &#10006 | 0 | Second offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.TimeZone` | `string or null` | &#10006 |  | Timezone of the date time (default UTC) |
| `GeneratorConfiguration.JsonFieldReplacements[].DateTime.Year` | `integer or string or null` | &#10006 |  | Constant Year of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].Double` | `object or string` | &#10006 |  | The value of the field if the type is 'Double' |
| `GeneratorConfiguration.JsonFieldReplacements[].Double.Value` | `number or string` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].FromDataSource` | `object or string` | &#10006 |  | The generation field configuration |
| `GeneratorConfiguration.JsonFieldReplacements[].FromDataSource.Name` | `string` | &#10004 |  | The name of the data source to use for the value of the field |
| `GeneratorConfiguration.JsonFieldReplacements[].FromDataSource.OutOfRangePolicy` | `one of [Null / Loop]` | &#10006 |  | The policy to use if the data source is out of range |
| `GeneratorConfiguration.JsonFieldReplacements[].Integer` | `object or string` | &#10006 |  | The value of the field if the type is 'Integer' |
| `GeneratorConfiguration.JsonFieldReplacements[].Integer.Value` | `integer or string` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].String` | `object or string` | &#10006 |  | The value of the field if the type is 'String' |
| `GeneratorConfiguration.JsonFieldReplacements[].String.Value` | `string` | &#10006 |  |  |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime` | `object or string` | &#10006 |  | The unix epoch time field configuration |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Day` | `integer or string or null` | &#10006 |  | Constant Day of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.DayOffset` | `integer or string` | &#10006 | 0 | Day offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Hour` | `integer or string or null` | &#10006 |  | Constant Hour of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.HourOffset` | `integer or string` | &#10006 | 0 | Hour offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Millisecond` | `integer or string or null` | &#10006 |  | Constant Millisecond of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.MillisecondOffset` | `integer or string` | &#10006 | 0 | Millisecond offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Minute` | `integer or string or null` | &#10006 |  | Constant Minute of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.MinuteOffset` | `integer or string` | &#10006 | 0 | Minute offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Month` | `integer or string or null` | &#10006 |  | Constant Month of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Second` | `integer or string or null` | &#10006 |  | Constant Second of the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.SecondOffset` | `integer or string` | &#10006 | 0 | Second offset from the date time |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.UnixEpochObjectType` | `one of [Long / String]` | &#10006 |  | Epoch Unix Time Object Representation |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.UnixEpochScaleType` | `one of [Seconds / Milliseconds]` | &#10006 |  | Epoch Unix Time Scale Representation |
| `GeneratorConfiguration.JsonFieldReplacements[].UnixEpochTime.Year` | `integer or string or null` | &#10006 |  | Constant Year of the date time |
| `GeneratorConfiguration.OutputObjectTypeConfiguration` | `object or string` | &#10006 |  | Output type of generation's Json configuration |
| `GeneratorConfiguration.OutputObjectTypeConfiguration.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `GeneratorConfiguration.OutputObjectTypeConfiguration.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
