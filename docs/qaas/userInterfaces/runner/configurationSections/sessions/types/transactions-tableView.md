# Transactions Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions[].Transactions` | `list or string or null` | &#10006 |  | List of all transactions to run build and for this session. Transactions iterate over data and use protocols to send it to the http applications, while saving the response data |
| `Sessions[].Transactions[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Name` | `string` | &#10004 |  | The communication action's name which acts as a unique identifier, used as the name of the communication action's produced input/output |
| `Sessions[].Transactions[].TimeoutMs` | `integer or string` | &#10004 |  | the consumption timeout in milliseconds (timeout is the time to wait for a response after sending a request) |
| `Sessions[].Transactions[].Configuration` | `object or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Iterations` | `integer or string` | &#10006 | 1 | How much iterations of the publishing action to execute |
| `Sessions[].Transactions[].Loop` | `string or true/false` | &#10006 | False | Whether to publish in loop |
| `Sessions[].Transactions[].SleepTimeMs` | `integer or string` | &#10006 | 0 | The time to sleep in milliseconds in between iterations |
| `Sessions[].Transactions[].Stage` | `integer or string` | &#10006 | 2 | The stage in which the Transaction runs at |
| `Sessions[].Transactions[].DataSourceNames` | `list or string or null` | &#10006 |  | The name of the data sources to publish the data of in the order their data will be published |
| `Sessions[].Transactions[].DataSourceNames[]` | `string` | &#10006 |  |  |
| `Sessions[].Transactions[].DataSourcePatterns` | `list or string or null` | &#10006 |  | Patterns of the names of data sources to publish the data of off |
| `Sessions[].Transactions[].DataSourcePatterns[]` | `string` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies` | `list or string` | &#10006 |  | List of policies to use when communicating with this action's protocol |
| `Sessions[].Transactions[].Policies[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance` | `object or string` | &#10006 |  | This policy executes actions in separate stages, each stage has a rate in which to execute the actions included in it and a count or timeout to know after how many actions or after how much time to end the stage and move to the next. |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages` | `list or string or null` | &#10006 |  | The stages of publishing information, in each stage the messages will be publishedwith a given rate untill 'Amount' messages are generated or untill 'TimeoutMs' is reached |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].Rate` | `number or string` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].Amount` | `integer or string or null` | &#10006 |  | The number of times to perform action |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].TimeoutMs` | `integer or string or null` | &#10006 |  | The time in milliseconds before stopping the communication action |
| `Sessions[].Transactions[].Policies[].Count` | `object or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].Count.Count` | `integer or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance` | `object or string` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed and increasing it overtime |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.MaxRate` | `integer or string` | &#10004 |  | The maximum amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.StartRate` | `integer or string` | &#10004 |  | The initial amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.RateIncrease` | `integer or string or null` | &#10006 | 1 | How much to increase the rate every RateIncreaseIntervalMs |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.RateIncreaseIntervalMs` | `number or string` | &#10006 | 1000 | How often to increase the rate by RateIncrease in milliseconds |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Transactions[].Policies[].LoadBalance` | `object or string` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed |
| `Sessions[].Transactions[].Policies[].LoadBalance.Rate` | `number or string` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Transactions[].Policies[].LoadBalance.TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Transactions[].Policies[].Timeout` | `object or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].Timeout.TimeoutMs` | `integer or string` | &#10006 |  |  |
| `Sessions[].Transactions[].Grpc` | `object or string` | &#10006 |  | Invokes a Grpc Method |
| `Sessions[].Transactions[].Grpc.AssemblyName` | `string` | &#10004 |  | The name of the assembly the grpc protos are defined in |
| `Sessions[].Transactions[].Grpc.Host` | `string` | &#10004 |  | Grpc server host |
| `Sessions[].Transactions[].Grpc.Port` | `integer or string` | &#10004 |  | Grpc server port |
| `Sessions[].Transactions[].Grpc.ProtoNameSpace` | `string` | &#10004 |  | The namespace the grpc protos are defined in |
| `Sessions[].Transactions[].Grpc.RpcName` | `string` | &#10004 |  | The name of the rpc to invoke |
| `Sessions[].Transactions[].Grpc.ServiceName` | `string` | &#10004 |  | The name of the service the rpc is defined in |
| `Sessions[].Transactions[].Http` | `object or string` | &#10006 |  | Sends an http request |
| `Sessions[].Transactions[].Http.BaseAddress` | `string` | &#10004 |  | The http server's address (needs to be with the protocol specification prefix http:// or https://) |
| `Sessions[].Transactions[].Http.Method` | `one of [Post / Put / Get / Delete]` | &#10004 |  | The http method the transactor should perform |
| `Sessions[].Transactions[].Http.Headers` | `object or string or null` | &#10006 |  | Default content headers to add to the http requests, will be overriden if sent data has http content headers in its metadata |
| `Sessions[].Transactions[].Http.MessageSendRetriesIntervalMs` | `integer or string` | &#10006 | 1000 | Time interval in milliseconds to wait between each retry of http request. |
| `Sessions[].Transactions[].Http.Port` | `integer or string or null` | &#10006 | 8080 | The port to send the requests to in the http server |
| `Sessions[].Transactions[].Http.RequestHeaders` | `object or string or null` | &#10006 |  | Default request headers to add to the http requests, will be overriden if sent data has http request headers in its metadata |
| `Sessions[].Transactions[].Http.Retries` | `integer or string` | &#10006 | 1 | The amount of times to retry each failed request |
| `Sessions[].Transactions[].Http.Route` | `string` | &#10006 |  | The route in the http server to send the request to |
| `Sessions[].Transactions[].Http.JwtAuth` | `object or string` | &#10006 |  | The JWT configurations for the generation and addition of a JWT as a Bearer authorization header, if this field is not configured will not use JwtAuth |
| `Sessions[].Transactions[].Http.JwtAuth.Secret` | `string` | &#10004 |  | The JWT secret |
| `Sessions[].Transactions[].Http.JwtAuth.BuildJwtConfig` | `string or true/false` | &#10006 | True | Whether to build JWT config with claims or send the Secret value as the auth token |
| `Sessions[].Transactions[].Http.JwtAuth.Claims` | `object or string` | &#10006 |  | Custom claims of the JWT |
| `Sessions[].Transactions[].Http.JwtAuth.HierarchicalClaims` | `string or null` | &#10006 |  | Custom Hierarchical claims of the JWT, Must be a string in yaml format. When set to a non null value the Claims field will be ignored and this will be used instead. |
| `Sessions[].Transactions[].Http.JwtAuth.HttpAuthScheme` | `one of [Bearer / Basic / Digest / JWT / ApiKey / Token]` | &#10006 |  | The authorization scheme to use |
| `Sessions[].Transactions[].Http.JwtAuth.JwtAlgorithm` | `one of [HMACSHA256Algorithm]` | &#10006 |  | The JWT Algorithm algorithm used |
| `Sessions[].Transactions[].InputDataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned sent (input) data |
| `Sessions[].Transactions[].InputDataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].InputDataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].InputDataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].InputSerialize` | `object or string` | &#10006 |  | The serializer to use to serialize the sent data |
| `Sessions[].Transactions[].InputSerialize.Serializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers |
| `Sessions[].Transactions[].OutputDataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned received (output) data |
| `Sessions[].Transactions[].OutputDataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].OutputDataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].OutputDataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].OutputDeserialize` | `object or string` | &#10006 |  | The deserializer to use to deserialize the received data |
| `Sessions[].Transactions[].OutputDeserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].Transactions[].OutputDeserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].Transactions[].OutputDeserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].Transactions[].OutputDeserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
