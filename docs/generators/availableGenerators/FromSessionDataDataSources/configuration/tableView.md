<!-- generated hash:1db56adfc291 sources:mocker-family, FromSessionDataDataSources, table-view -->

# FromSessionDataDataSources Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `list or string or null` | &#10006 |  |  |
| `GeneratorConfiguration[]` | `object or string` | &#10006 |  | Supports generating data from multiple DataSources that contain SessionData files. `DataSources`: All Used. Must all be serialized (`byte[]`) `SessionData` items. `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration[].SessionName` | `string` | &#10004 |  | name of the session to load the outputs/inputs of as part of the generated data |
| `GeneratorConfiguration[].CommunicationDataList` | `list or string` | &#10004 |  | All of the communnication data items in the given session data to load as part of the generated data by the order listed here |
| `GeneratorConfiguration[].CommunicationDataList[]` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration[].CommunicationDataList[].Name` | `string` | &#10004 |  | The name of the communication data in the session data to generate |
| `GeneratorConfiguration[].CommunicationDataList[].Type` | `one of [Input / Output]` | &#10004 |  | The type of the communication data to generate. Options: [ `Input` -  an input communication data from the Inputs list in the SessionData structure / `Output` - an output communication data from the Outputs list in the SessionData structure ] |
