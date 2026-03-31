# Mocker Commands Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions[].MockerCommands` | `list or string or null` | &#10006 |  | List of all mocker commands to run for this session. Mocker Commands trigger the mocker instance through redis api to act specific actions |
| `Sessions[].MockerCommands[]` | `object or string` | &#10006 |  |  |
| `Sessions[].MockerCommands[].Name` | `string` | &#10004 |  | The name of the mocker command |
| `Sessions[].MockerCommands[].ServerName` | `string` | &#10004 |  | The name of the mocker server to interact with |
| `Sessions[].MockerCommands[].RequestDurationMs` | `integer or string` | &#10006 | 3000 | The duration the runner will try to request the mocker server instances |
| `Sessions[].MockerCommands[].RequestRetries` | `integer or string` | &#10006 | 3 | The amount of retries the runner will try to request the mocker server instances |
| `Sessions[].MockerCommands[].Stage` | `integer or string` | &#10006 | 4 | The stage in which the Mocker Command runs at |
| `Sessions[].MockerCommands[].Command` | `object or string` | &#10004 |  | The command action to commit |
| `Sessions[].MockerCommands[].Command.ChangeActionStub` | `object or string` | &#10006 |  | Mocker 'ChangeActionStub' command properties |
| `Sessions[].MockerCommands[].Command.ChangeActionStub.ActionName` | `string` | &#10004 |  | The Action's name that is being changed |
| `Sessions[].MockerCommands[].Command.ChangeActionStub.StubName` | `string` | &#10004 |  | The Stub's Name attached to the action |
| `Sessions[].MockerCommands[].Command.Consume` | `object or string` | &#10006 |  | Mocker 'Consume' command properties |
| `Sessions[].MockerCommands[].Command.Consume.TimeoutMs` | `integer or string` | &#10004 |  | The Timeout (ms) while consuming data from Mock Servers |
| `Sessions[].MockerCommands[].Command.Consume.ActionName` | `string or null` | &#10006 |  | The Action name to consume, if not given consumes all action |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned Mocker Input data |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize` | `object or string` | &#10006 |  | The deserializer to use to deserialize the consumed input data received by the mocker |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned Mocker Output data |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize` | `object or string` | &#10006 |  | The deserializer to use to deserialize the consumed output data published by the mocker |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].MockerCommands[].Command.TriggerAction` | `object or string` | &#10006 |  | Mocker 'TriggerAction' command properties |
| `Sessions[].MockerCommands[].Command.TriggerAction.ActionName` | `string` | &#10004 |  | The Action's name that is being triggered |
| `Sessions[].MockerCommands[].Command.TriggerAction.TimeoutMs` | `integer or string` | &#10006 | 0 | The time to enable the action for in milliseconds |
| `Sessions[].MockerCommands[].Redis` | `object or string` | &#10004 |  | The server controller redis API |
| `Sessions[].MockerCommands[].Redis.Host` | `string` | &#10004 |  | Redis hostname (should contain the port too for example: - 'host1:8080') |
| `Sessions[].MockerCommands[].Redis.AbortOnConnectFail` | `string or true/false` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `Sessions[].MockerCommands[].Redis.AsyncTimeoutMs` | `integer or string` | &#10006 | 5000 | Timeout to allow for asynchronous operations |
| `Sessions[].MockerCommands[].Redis.ClientName` | `string or null` | &#10006 |  | Identification for the connection within redis |
| `Sessions[].MockerCommands[].Redis.ConnectRetry` | `integer or string` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `Sessions[].MockerCommands[].Redis.KeepAliveSeconds` | `integer or string` | &#10006 | 60 | Time at which to send a message to help keep alive |
| `Sessions[].MockerCommands[].Redis.Password` | `string or null` | &#10006 |  | Password for the redis server |
| `Sessions[].MockerCommands[].Redis.RedisDataBase` | `integer or string` | &#10006 | 0 | Redis database to use |
| `Sessions[].MockerCommands[].Redis.Ssl` | `string or true/false` | &#10006 | False | Specifies whether SSL encryption should be used |
| `Sessions[].MockerCommands[].Redis.SslHost` | `string or null` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `Sessions[].MockerCommands[].Redis.Username` | `string or null` | &#10006 |  | User for the redis server |
| `Sessions[].MockerCommands[].Configuration` | `object or string` | &#10006 |  |  |
| `Sessions[].MockerCommands[].Configuration.ChangeActionStub` | `object or string` | &#10006 |  | Mocker 'ChangeActionStub' command properties |
| `Sessions[].MockerCommands[].Configuration.ChangeActionStub.ActionName` | `string` | &#10004 |  | The Action's name that is being changed |
| `Sessions[].MockerCommands[].Configuration.ChangeActionStub.StubName` | `string` | &#10004 |  | The Stub's Name attached to the action |
| `Sessions[].MockerCommands[].Configuration.Consume` | `object or string` | &#10006 |  | Mocker 'Consume' command properties |
| `Sessions[].MockerCommands[].Configuration.Consume.TimeoutMs` | `integer or string` | &#10004 |  | The Timeout (ms) while consuming data from Mock Servers |
| `Sessions[].MockerCommands[].Configuration.Consume.ActionName` | `string or null` | &#10006 |  | The Action name to consume, if not given consumes all action |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned Mocker Input data |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDeserialize` | `object or string` | &#10006 |  | The deserializer to use to deserialize the consumed input data received by the mocker |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDeserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDeserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDeserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].MockerCommands[].Configuration.Consume.InputDeserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned Mocker Output data |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDeserialize` | `object or string` | &#10006 |  | The deserializer to use to deserialize the consumed output data published by the mocker |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDeserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDeserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDeserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].MockerCommands[].Configuration.Consume.OutputDeserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].MockerCommands[].Configuration.TriggerAction` | `object or string` | &#10006 |  | Mocker 'TriggerAction' command properties |
| `Sessions[].MockerCommands[].Configuration.TriggerAction.ActionName` | `string` | &#10004 |  | The Action's name that is being triggered |
| `Sessions[].MockerCommands[].Configuration.TriggerAction.TimeoutMs` | `integer or string` | &#10006 | 0 | The time to enable the action for in milliseconds |
