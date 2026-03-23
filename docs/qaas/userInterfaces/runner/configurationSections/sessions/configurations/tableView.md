<!-- generated hash:7740ca1880b7 sources:runner-family, Sessions, table-view -->

# Sessions Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions` | `Array | Null | String` | &#10006 |  | List of all sessions to run. Sessions contain the actions performed against the tested system and its underlying infrastructure in order to receive response data from the tested system to assert on. |
| `Sessions[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Name` | `String` | &#10004 |  | The name of the session, used to uniquely identify it and its output |
| `Sessions[].Category` | `Null | String` | &#10006 |  | The category of the session, you can filter which categories to run using the -I flag |
| `Sessions[].RunUntilStage` | `Integer | Null | String` | &#10006 |  | Optional stage number that decides when the runner waits for this session to complete. If omitted, the session becomes visible only after its own stage completes. If set, the runner defers waiting until the configured future stage is reached. |
| `Sessions[].SaveData` | `Boolean | String` | &#10006 | True | Whether or not to save the session's output, if false any data is discarded after its iterated over and the SessionData as a whole is not saved. |
| `Sessions[].Stage` | `Integer | Null | String` | &#10006 |  | The stage of the session. Sessions with the same stage runs together. stage defaultly gets the index of the session in session list  |
| `Sessions[].TimeoutAfterSessionMs` | `Integer | String` | &#10006 | 0 | The time in milliseconds to wait after the session ends |
| `Sessions[].TimeoutBeforeSessionMs` | `Integer | String` | &#10006 | 0 | The time in milliseconds to wait before the session starts |
| `Sessions[].Collectors` | `Array | Null | String` | &#10006 |  | List of all collectors to build and run for this session. Collectors fetch information about the application from 3rd party apis on the sessions runtime |
| `Sessions[].Collectors[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Collectors[].Name` | `String` | &#10004 |  | The name of the collector |
| `Sessions[].Collectors[].EndTimeReachedCheckIntervalMs` | `Integer | String` | &#10006 | 1000 | The check interval in milliseconds of the check that the current UTC time is past the collection end time, so the collection action can happen. |
| `Sessions[].Collectors[].CollectionRange` | `Object | String` | &#10006 |  | The collection range of the collector's action contains parameters for the start and end times of the collection range in relation to the start and end time of the collector's session. |
| `Sessions[].Collectors[].CollectionRange.EndTimeMs` | `Integer | String` | &#10006 | 0 | The end time of the collection range in relation to the session end time, given in milliseconds, is added to the session's start time as is to determine the collection end time. |
| `Sessions[].Collectors[].CollectionRange.StartTimeMs` | `Integer | String` | &#10006 | 0 | The start time of the collection range in relation to the session start time, given in milliseconds, is added to the session's start time as is to determine the collection start time. |
| `Sessions[].Collectors[].DataFilter` | `Object | String` | &#10006 |  | How to filter the properties of each returned collected data |
| `Sessions[].Collectors[].DataFilter.Body` | `Boolean | String` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Collectors[].DataFilter.MetaData` | `Boolean | String` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Collectors[].DataFilter.Timestamp` | `Boolean | String` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Collectors[].Prometheus` | `Object | String` | &#10006 |  | Collects messages from the prometheus `query_range` API and saves each of them as an item of a vector result's array. vector is a result type in prometheus that represents a set of time series data, every item of its result array represents a single value at a certain time. |
| `Sessions[].Collectors[].Prometheus.Expression` | `String` | &#10004 |  | The expression to query the prometheus query_range API with to collect data |
| `Sessions[].Collectors[].Prometheus.Url` | `String` | &#10004 |  | The prometheus' url, the base url without any route |
| `Sessions[].Collectors[].Prometheus.ApiKey` | `Null | String` | &#10006 |  | The api key for interacting with prometheus |
| `Sessions[].Collectors[].Prometheus.SampleIntervalMs` | `Integer | String` | &#10006 | 30000 | The interval to sample the expression's value from the prometheus during the collection time range in milliseconds |
| `Sessions[].Collectors[].Prometheus.TimeoutMs` | `Integer | String` | &#10006 | 120000 | The timeout in milliseconds for the execution of the query sent to the prometheus API |
| `Sessions[].Consumers` | `Array | Null | String` | &#10006 |  | List of all consumers to build and run for this session. Consumers use protocols to receive data from the application |
| `Sessions[].Consumers[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Consumers[].Name` | `String` | &#10004 |  | The name of the consumer |
| `Sessions[].Consumers[].TimeoutMs` | `Integer | String` | &#10004 |  | The consumption timeout in milliseconds (timeout is the time since last message was read by the consumer) |
| `Sessions[].Consumers[].Stage` | `Integer | String` | &#10006 | 0 | The stage in which the Consumer runs at |
| `Sessions[].Consumers[].Policies` | `Array | String` | &#10006 |  | List of policies to use when communicating with this action's protocol |
| `Sessions[].Consumers[].Policies[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance` | `Object | String` | &#10006 |  | This policy executes actions in separate stages, each stage has a rate in which to execute the actions included in it and a count or timeout to know after how many actions or after how much time to end the stage and move to the next. |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages` | `Array | String` | &#10004 |  | The stages of publishing information, in each stage the messages will be publishedwith a given rate untill 'Amount' messages are generated or untill 'TimeoutMs' is reached |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].Rate` | `Number | String` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].Amount` | `Integer | Null | String` | &#10006 |  | The number of times to perform action |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].TimeoutMs` | `Integer | Null | String` | &#10006 |  | The time in milliseconds before stopping the communication action |
| `Sessions[].Consumers[].Policies[].Count` | `Object | String` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].Count.Count` | `Integer | String` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance` | `Object | String` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed and increasing it overtime |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.MaxRate` | `Integer | String` | &#10004 |  | The maximum amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.StartRate` | `Integer | String` | &#10004 |  | The initial amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.RateIncrease` | `Integer | Null | String` | &#10006 | 1 | How much to increase the rate every RateIncreaseIntervalMs |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.RateIncreaseIntervalMs` | `Number | String` | &#10006 | 1000 | How often to increase the rate by RateIncrease in milliseconds |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Consumers[].Policies[].LoadBalance` | `Object | String` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed |
| `Sessions[].Consumers[].Policies[].LoadBalance.Rate` | `Number | String` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Consumers[].Policies[].LoadBalance.TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Consumers[].Policies[].Timeout` | `Object | String` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].Timeout.TimeoutMs` | `Integer | String` | &#10006 |  |  |
| `Sessions[].Consumers[].DataFilter` | `Object | String` | &#10006 |  | How to filter the properties of each returned consumed data |
| `Sessions[].Consumers[].DataFilter.Body` | `Boolean | String` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Consumers[].DataFilter.MetaData` | `Boolean | String` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Consumers[].DataFilter.Timestamp` | `Boolean | String` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Consumers[].Deserialize` | `Object | String` | &#10006 |  | Serializer to use to deserialize the consumed data |
| `Sessions[].Consumers[].Deserialize.Deserializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].Consumers[].Deserialize.SpecificType` | `Object | String` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].Consumers[].Deserialize.SpecificType.TypeFullName` | `String` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].Consumers[].Deserialize.SpecificType.AssemblyName` | `Null | String` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].Consumers[].ElasticIndices` | `Object | String` | &#10006 |  | Consumes documents from elasticsearch indices by an index pattern |
| `Sessions[].Consumers[].ElasticIndices.IndexPattern` | `String` | &#10004 |  | The index pattern of the relevant indices |
| `Sessions[].Consumers[].ElasticIndices.Password` | `String` | &#10004 |  | The password of the elasticsearch |
| `Sessions[].Consumers[].ElasticIndices.Url` | `String` | &#10004 |  | The url of the elasticsearch |
| `Sessions[].Consumers[].ElasticIndices.Username` | `String` | &#10004 |  | The username of the elasticsearch |
| `Sessions[].Consumers[].ElasticIndices.FilterSecondsBeforeRunStartTime` | `Integer | String` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start consuming messages in seconds |
| `Sessions[].Consumers[].ElasticIndices.MatchQueryString` | `String` | &#10006 | * | The match query string for the documents from the relevant indices |
| `Sessions[].Consumers[].ElasticIndices.ReadBatchSize` | `Integer | String` | &#10006 | 1000 | The size of the batch of documents to read from the elastic index pattern while scrolling its contents |
| `Sessions[].Consumers[].ElasticIndices.ReadFromRunStartTime` | `Boolean | String` | &#10006 | False | Whether to only read messages that arrived to the elastic after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].ElasticIndices.RequestTimeoutMs` | `Integer | String` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |
| `Sessions[].Consumers[].ElasticIndices.ScrollContextExpirationMs` | `Integer | String` | &#10006 | 100000 | Specify how long a consistent view of the index should be maintained for scrolled search in milliseconds |
| `Sessions[].Consumers[].ElasticIndices.TimestampField` | `String` | &#10006 | @timestamp | The json path to the main timestamp field to use for deciding a queried item's latest update time |
| `Sessions[].Consumers[].IbmMqQueue` | `Object | String` | &#10006 |  | Consumes messages from IbmMq queue |
| `Sessions[].Consumers[].IbmMqQueue.Channel` | `String` | &#10004 |  | The name of the channel to connect to |
| `Sessions[].Consumers[].IbmMqQueue.HostName` | `String` | &#10004 |  | The name of the host machine hosting the IbmMq |
| `Sessions[].Consumers[].IbmMqQueue.Manager` | `String` | &#10004 |  | The name of the IbmMq manager to connect to |
| `Sessions[].Consumers[].IbmMqQueue.Port` | `Integer | String` | &#10004 |  | The port number the IbmMq is listening on |
| `Sessions[].Consumers[].IbmMqQueue.QueueName` | `String` | &#10004 |  | Name of the queue to read messages from |
| `Sessions[].Consumers[].KafkaTopic` | `Object | String` | &#10006 |  | Consumes messages from a kafka topic |
| `Sessions[].Consumers[].KafkaTopic.GroupId` | `String` | &#10004 |  | The group name to be used when reading messages |
| `Sessions[].Consumers[].KafkaTopic.Password` | `String` | &#10004 |  | Kafka Service with read permissions for the topic's password |
| `Sessions[].Consumers[].KafkaTopic.TopicName` | `String` | &#10004 |  | Name of the topic to read messages from |
| `Sessions[].Consumers[].KafkaTopic.Username` | `String` | &#10004 |  | Kafka Service with read permissions for the topic's username |
| `Sessions[].Consumers[].KafkaTopic.AutoOffsetReset` | `enum [Latest / Earliest / Error]` | &#10006 |  | Where the reader starts reading from in the topic when being created, latest means it starts reading only messages received after it started reading, other options such as Earliest can be found online. |
| `Sessions[].Consumers[].KafkaTopic.EnableAutoCommit` | `Boolean | String` | &#10006 | True | Whether the read mechanism will commit the offsets automatically and periodically in the background. |
| `Sessions[].Consumers[].KafkaTopic.FetchMinBytes` | `Integer | String` | &#10006 | 1 | Minimum number of bytes the broker responds with. If `FetchWaitMaxMs` expires the accumulated data will be sent to the client regardless of this setting. |
| `Sessions[].Consumers[].KafkaTopic.FetchWaitMaxMs` | `Integer | String` | &#10006 | 2000 | Maximum time the broker may wait to fill the Fetch response with `FetchMinBytes` of messages. |
| `Sessions[].Consumers[].KafkaTopic.HeartbeatIntervalMs` | `Integer | String` | &#10006 | 1000 | Group session keepalive heartbeat interval |
| `Sessions[].Consumers[].KafkaTopic.MaxPollIntervalMs` | `Integer | String` | &#10006 | 15000 | Maximum allowed time between calls to read messages for high-level readers. If this interval is exceeded the reader is considered failed and the group will rebalance in order to reassign the partitions to another reader group member |
| `Sessions[].Consumers[].KafkaTopic.PartitionAssignmentStrategy` | `enum [Range / RoundRobin / CooperativeSticky]` | &#10006 |  | The name of a partition assignment strategy to use. The elected group leader will use a strategy supported by all members of the group to assign partitions to group members. Options: [ `CooperativeSticky` - Ensures that a reader retains its exsting partitions unless it fails, providing stability in partition ownership` / `Range` - Distributes partitions evenly across readers by assigning each reader a range of partitions / `RoundRobin` - Assigns partitions to readers in a circular order, distributing them sequentially ]  |
| `Sessions[].Consumers[].KafkaTopic.SaslMechanism` | `enum [Gssapi / Plain / ScramSha256 / ScramSha512 / OAuthBearer]` | &#10006 |  | The Sasl mechanism used in the kafka |
| `Sessions[].Consumers[].KafkaTopic.SecurityProtocol` | `enum [Plaintext / Ssl / SaslPlaintext / SaslSsl]` | &#10006 |  | The Sasl's security protocol |
| `Sessions[].Consumers[].KafkaTopic.SessionTimeOutMs` | `Integer | String` | &#10006 | 9000 | The maximum amount of time in milliseconds the reader can go without sending a heartbeat to the reader group coordinator before its considered dead |
| `Sessions[].Consumers[].KafkaTopic.HostNames` | `Array | String` | &#10004 |  | List of the kafka hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `Sessions[].Consumers[].KafkaTopic.HostNames[]` | `String` | &#10006 |  |  |
| `Sessions[].Consumers[].MsSqlTable` | `Object | String` | &#10006 |  | Consume messages from an mssql database table |
| `Sessions[].Consumers[].MsSqlTable.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].MsSqlTable.TableName` | `String` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].MsSqlTable.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].MsSqlTable.FilterSecondsBeforeRunStartTime` | `Integer | String` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].MsSqlTable.InsertionTimeField` | `Null | String` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].MsSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `Integer | String` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].MsSqlTable.ReadFromRunStartTime` | `Boolean | String` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].MsSqlTable.WhereStatement` | `Null | String` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].MsSqlTable.ColumnsToIgnore` | `Array | String` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].MsSqlTable.ColumnsToIgnore[]` | `String` | &#10006 |  |  |
| `Sessions[].Consumers[].OracleSqlTable` | `Object | String` | &#10006 |  | Consume messages from an oracle sql database table |
| `Sessions[].Consumers[].OracleSqlTable.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].OracleSqlTable.TableName` | `String` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].OracleSqlTable.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].OracleSqlTable.FilterSecondsBeforeRunStartTime` | `Integer | String` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].OracleSqlTable.InsertionTimeField` | `Null | String` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].OracleSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `Integer | String` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].OracleSqlTable.ReadFromRunStartTime` | `Boolean | String` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].OracleSqlTable.WhereStatement` | `Null | String` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].OracleSqlTable.ColumnsToIgnore` | `Array | String` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].OracleSqlTable.ColumnsToIgnore[]` | `String` | &#10006 |  |  |
| `Sessions[].Consumers[].PostgreSqlTable` | `Object | String` | &#10006 |  | Consume messages from an postgresql database table |
| `Sessions[].Consumers[].PostgreSqlTable.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].PostgreSqlTable.TableName` | `String` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].PostgreSqlTable.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].PostgreSqlTable.FilterSecondsBeforeRunStartTime` | `Integer | String` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].PostgreSqlTable.InsertionTimeField` | `Null | String` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].PostgreSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `Integer | String` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].PostgreSqlTable.IsInsertionTimeFieldTimeZoneTz` | `Boolean | String` | &#10006 | False | Whether the InsertionTimeField is of type `timezonetz` (true) or not (false), if it is and this is configurd to true it will be treated as if its timezone is utc |
| `Sessions[].Consumers[].PostgreSqlTable.ReadFromRunStartTime` | `Boolean | String` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].PostgreSqlTable.WhereStatement` | `Null | String` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].PostgreSqlTable.ColumnsToIgnore` | `Array | String` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].PostgreSqlTable.ColumnsToIgnore[]` | `String` | &#10006 |  |  |
| `Sessions[].Consumers[].RabbitMq` | `Object | String` | &#10006 |  | Consumes messages from a rabbitmq |
| `Sessions[].Consumers[].RabbitMq.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `Sessions[].Consumers[].RabbitMq.ContinuationTimeoutSeconds` | `Integer | String` | &#10006 | 5 | Amount of time protocol operations (e.g. queue.declare) are allowed to take before timing out in seconds |
| `Sessions[].Consumers[].RabbitMq.CreatedQueueTimeToExpireMs` | `Number | String` | &#10006 | 300000 | The amount of milliseconds before the created queue is deleted when it has no readrs |
| `Sessions[].Consumers[].RabbitMq.ExchangeName` | `Null | String` | &#10006 |  | Name of the exchange to read messages fromCannot be set if configured QueueName to read from. |
| `Sessions[].Consumers[].RabbitMq.HandshakeContinuationTimeoutSeconds` | `Integer | String` | &#10006 | 10 | Amount of time protocol handshake operations are allowed to take before timing out in seconds |
| `Sessions[].Consumers[].RabbitMq.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `Sessions[].Consumers[].RabbitMq.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `Sessions[].Consumers[].RabbitMq.QueueName` | `Null | String` | &#10006 |  | Name of the queue to read messages fromCannot be set if configured ExchangeName to read from. |
| `Sessions[].Consumers[].RabbitMq.RequestedConnectionTimeoutSeconds` | `Integer | String` | &#10006 | 5 | Timeout setting for connection attempts in seconds |
| `Sessions[].Consumers[].RabbitMq.RoutingKey` | `String` | &#10006 | / | Routing key of messages to read |
| `Sessions[].Consumers[].RabbitMq.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `Sessions[].Consumers[].RabbitMq.VirtualHost` | `String` | &#10006 | / | Rabbitmq virual host to access during this connection |
| `Sessions[].Consumers[].S3Bucket` | `Object | String` | &#10006 |  | Consumes messages from an s3 bucket |
| `Sessions[].Consumers[].S3Bucket.AccessKey` | `String` | &#10004 |  | S3 account access key |
| `Sessions[].Consumers[].S3Bucket.SecretKey` | `String` | &#10004 |  | S3 account secret access key |
| `Sessions[].Consumers[].S3Bucket.ServiceURL` | `String` | &#10004 |  | S3 service url |
| `Sessions[].Consumers[].S3Bucket.StorageBucket` | `String` | &#10004 |  | Name of S3 bucket |
| `Sessions[].Consumers[].S3Bucket.Delimiter` | `String` | &#10006 |  | Delimiter of the objects to read from s3 bucket, this determines what objects will be retrieved from the bucket, objects that have at least one occurence of the delimiter in their relative path after the `Prefix` will not be retrieved from the bucket. |
| `Sessions[].Consumers[].S3Bucket.ForcePathStyle` | `Boolean | String` | &#10006 | True | When true, requests will always use path style addressing |
| `Sessions[].Consumers[].S3Bucket.MaximumRetryCount` | `Integer | Null | String` | &#10006 |  | The maximum number of times to retry when an action against the S3 fails due to maximum S3 supported IOPS, if no value is given will retry indefinitely |
| `Sessions[].Consumers[].S3Bucket.Prefix` | `String` | &#10006 |  | Prefix of the objects to read from s3 bucket |
| `Sessions[].Consumers[].S3Bucket.ReadFromRunStartTime` | `Boolean | String` | &#10006 | False | Whether to only read messages that were last modified after the start of the read action (true) or read all messages regardless of latest modification time (false) |
| `Sessions[].Consumers[].S3Bucket.SkipEmptyObjects` | `Boolean | String` | &#10006 | False | Whether to skip the read of empty s3 objects or not, if true skips them if false doesnt skip them |
| `Sessions[].Consumers[].Socket` | `Object | String` | &#10006 |  | Consumes messages from socket communications in various protocols |
| `Sessions[].Consumers[].Socket.Host` | `String` | &#10004 |  | Socket connection endpoint hostname |
| `Sessions[].Consumers[].Socket.Port` | `Integer | String` | &#10004 |  | Socket connection endpoint port |
| `Sessions[].Consumers[].Socket.ProtocolType` | `enum [IP / IPv6HopByHopOptions / Unspecified / Icmp / Igmp / Ggp / IPv4 / Tcp / Pup / Udp / Idp / IPv6 / IPv6RoutingHeader / IPv6FragmentHeader / IPSecEncapsulatingSecurityPayload / IPSecAuthenticationHeader / IcmpV6 / IPv6NoNextHeader / IPv6DestinationOptions / ND / Raw / Ipx / Spx / SpxII / Unknown]` | &#10004 |  | Specifies the protocol to use in the socket |
| `Sessions[].Consumers[].Socket.AddressFamily` | `enum [Unspecified / Unix / InterNetwork / ImpLink / Pup / Chaos / NS / Ipx / Iso / Osi / Ecma / DataKit / Ccitt / Sna / DecNet / DataLink / Lat / HyperChannel / AppleTalk / NetBios / VoiceView / FireFox / Banyan / Atm / InterNetworkV6 / Cluster / Ieee12844 / Irda / NetworkDesigners / Max / Packet / ControllerAreaNetwork / Unknown]` | &#10006 |  | Specifies the addressing scheme to use in the socket |
| `Sessions[].Consumers[].Socket.BufferSize` | `Integer | String` | &#10006 | 65536 | Size of the receive buffer, in bytes |
| `Sessions[].Consumers[].Socket.ReceiveTimeoutMs` | `Integer | String` | &#10006 | 5000 | Timeout receiving a packet in milliseconds |
| `Sessions[].Consumers[].Socket.SeperationChar` | `Null | String` | &#10006 |  | Character to seperate read buffers into messages (delimiter) - when left blank - messages will be set by default buffer seperation |
| `Sessions[].Consumers[].Socket.SocketType` | `enum [Stream / Dgram / Raw / Rdm / Seqpacket / Unknown]` | &#10006 |  | Specifies the type of socket |
| `Sessions[].Consumers[].TrinoSqlTable` | `Object | String` | &#10006 |  | Consume messages from a trino sql database table |
| `Sessions[].Consumers[].TrinoSqlTable.Catalog` | `String` | &#10004 |  | The catalog that the table name in it |
| `Sessions[].Consumers[].TrinoSqlTable.ClientTag` | `String` | &#10004 |  | The client tag in the Trino, team or environment tag |
| `Sessions[].Consumers[].TrinoSqlTable.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].TrinoSqlTable.Hostname` | `String` | &#10004 |  | The hostname of the Trino |
| `Sessions[].Consumers[].TrinoSqlTable.Password` | `String` | &#10004 |  | The password to login to the Trino |
| `Sessions[].Consumers[].TrinoSqlTable.Schema` | `String` | &#10004 |  | The name of the schema that holds the table name in it |
| `Sessions[].Consumers[].TrinoSqlTable.TableName` | `String` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].TrinoSqlTable.Username` | `String` | &#10004 |  | The username to login to the Trino |
| `Sessions[].Consumers[].TrinoSqlTable.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].TrinoSqlTable.FilterSecondsBeforeRunStartTime` | `Integer | String` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].TrinoSqlTable.InsertionTimeField` | `Null | String` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].TrinoSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `Integer | String` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].TrinoSqlTable.ReadFromRunStartTime` | `Boolean | String` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].TrinoSqlTable.WhereStatement` | `Null | String` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].TrinoSqlTable.ColumnsToIgnore` | `Array | String` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].TrinoSqlTable.ColumnsToIgnore[]` | `String` | &#10006 |  |  |
| `Sessions[].MockerCommands` | `Array | Null | String` | &#10006 |  | List of all mocker commands to run for this session. Mocker Commands trigger the mocker instance through redis api to act specific actions |
| `Sessions[].MockerCommands[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].MockerCommands[].Name` | `String` | &#10004 |  | The name of the mocker command |
| `Sessions[].MockerCommands[].ServerName` | `String` | &#10004 |  | The name of the mocker server to interact with |
| `Sessions[].MockerCommands[].RequestDurationMs` | `Integer | String` | &#10006 | 3000 | The duration the runner will try to request the mocker server instances |
| `Sessions[].MockerCommands[].RequestRetries` | `Integer | String` | &#10006 | 3 | The amount of retries the runner will try to request the mocker server instances |
| `Sessions[].MockerCommands[].Stage` | `Integer | String` | &#10006 | 4 | The stage in which the Mocker Command runs at |
| `Sessions[].MockerCommands[].Command` | `Object | String` | &#10004 |  | The command action to commit |
| `Sessions[].MockerCommands[].Command.ChangeActionStub` | `Object | String` | &#10006 |  | Mocker 'ChangeActionStub' command properties |
| `Sessions[].MockerCommands[].Command.ChangeActionStub.ActionName` | `String` | &#10004 |  | The Action's name that is being changed |
| `Sessions[].MockerCommands[].Command.ChangeActionStub.StubName` | `String` | &#10004 |  | The Stub's Name attached to the action |
| `Sessions[].MockerCommands[].Command.Consume` | `Object | String` | &#10006 |  | Mocker 'Consume' command properties |
| `Sessions[].MockerCommands[].Command.Consume.TimeoutMs` | `Integer | String` | &#10004 |  | The Timeout (ms) while consuming data from Mock Servers |
| `Sessions[].MockerCommands[].Command.Consume.ActionName` | `Null | String` | &#10006 |  | The Action name to consume, if not given consumes all action |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter` | `Object | String` | &#10006 |  | How to filter the properties of each returned Mocker Input data |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter.Body` | `Boolean | String` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter.MetaData` | `Boolean | String` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.InputDataFilter.Timestamp` | `Boolean | String` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize` | `Object | String` | &#10006 |  | The deserializer to use to deserialize the consumed input data received by the mocker |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.Deserializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.SpecificType` | `Object | String` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.SpecificType.TypeFullName` | `String` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].MockerCommands[].Command.Consume.InputDeserialize.SpecificType.AssemblyName` | `Null | String` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter` | `Object | String` | &#10006 |  | How to filter the properties of each returned Mocker Output data |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter.Body` | `Boolean | String` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter.MetaData` | `Boolean | String` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.OutputDataFilter.Timestamp` | `Boolean | String` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize` | `Object | String` | &#10006 |  | The deserializer to use to deserialize the consumed output data published by the mocker |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.Deserializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.SpecificType` | `Object | String` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.SpecificType.TypeFullName` | `String` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].MockerCommands[].Command.Consume.OutputDeserialize.SpecificType.AssemblyName` | `Null | String` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].MockerCommands[].Command.TriggerAction` | `Object | String` | &#10006 |  | Mocker 'TriggerAction' command properties |
| `Sessions[].MockerCommands[].Command.TriggerAction.ActionName` | `String` | &#10004 |  | The Action's name that is being triggered |
| `Sessions[].MockerCommands[].Command.TriggerAction.TimeoutMs` | `Integer | String` | &#10006 | 0 | The time to enable the action for in milliseconds |
| `Sessions[].MockerCommands[].Redis` | `Object | String` | &#10004 |  | The server controller redis API |
| `Sessions[].MockerCommands[].Redis.Host` | `String` | &#10004 |  | Redis hostname (should contain the port too for example: - 'host1:8080') |
| `Sessions[].MockerCommands[].Redis.AbortOnConnectFail` | `Boolean | String` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `Sessions[].MockerCommands[].Redis.AsyncTimeoutMs` | `Integer | String` | &#10006 | 5000 | Timeout to allow for asynchronous operations |
| `Sessions[].MockerCommands[].Redis.ClientName` | `Null | String` | &#10006 |  | Identification for the connection within redis |
| `Sessions[].MockerCommands[].Redis.ConnectRetry` | `Integer | String` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `Sessions[].MockerCommands[].Redis.KeepAliveSeconds` | `Integer | String` | &#10006 | 60 | Time at which to send a message to help keep alive |
| `Sessions[].MockerCommands[].Redis.Password` | `Null | String` | &#10006 |  | Password for the redis server |
| `Sessions[].MockerCommands[].Redis.RedisDataBase` | `Integer | String` | &#10006 | 0 | Redis database to use |
| `Sessions[].MockerCommands[].Redis.Ssl` | `Boolean | String` | &#10006 | False | Specifies whether SSL encryption should be used |
| `Sessions[].MockerCommands[].Redis.SslHost` | `Null | String` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `Sessions[].MockerCommands[].Redis.Username` | `Null | String` | &#10006 |  | User for the redis server |
| `Sessions[].Probes` | `Array | Null | String` | &#10006 |  | List of all probes to build and run for this session. Probes are hook methods that do not return data, and can be integrated inside session run |
| `Sessions[].Probes[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Probes[].Name` | `String` | &#10004 |  | The name of the probe |
| `Sessions[].Probes[].Probe` | `String` | &#10004 |  | The name of the probe to use |
| `Sessions[].Probes[].ProbeConfiguration` | `Null | Object | String` | &#10006 |  | Implementation configuration for the probe, the configuration given here is loaded into the provided probe dynamically. |
| `Sessions[].Probes[].Stage` | `Integer | String` | &#10006 | 3 | The stage in which the Probe runs at |
| `Sessions[].Probes[].DataSourceNames` | `Array | String` | &#10006 |  | Names of the pre defined data sources to pass to the probe |
| `Sessions[].Probes[].DataSourceNames[]` | `String` | &#10006 |  |  |
| `Sessions[].Probes[].DataSourcePatterns` | `Array | String` | &#10006 |  | Regex patterns of data sources |
| `Sessions[].Probes[].DataSourcePatterns[]` | `String` | &#10006 |  |  |
| `Sessions[].Publishers` | `Array | Null | String` | &#10006 |  | List of all publishers to build and run for this session. Publishers iterate over data and use protocols to send it to the application |
| `Sessions[].Publishers[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Publishers[].Name` | `String` | &#10004 |  | The name of the publisher |
| `Sessions[].Publishers[].Iterations` | `Integer | String` | &#10006 | 1 | How much iterations of the publishing action to execute |
| `Sessions[].Publishers[].Loop` | `Boolean | String` | &#10006 | False | Whether to publish in loop |
| `Sessions[].Publishers[].SleepTimeMs` | `Integer | String` | &#10006 | 0 | The time to sleep in milliseconds in between iterations |
| `Sessions[].Publishers[].Stage` | `Integer | String` | &#10006 | 1 | The stage in which the Publisher runs at |
| `Sessions[].Publishers[].DataSourceNames` | `Array | Null | String` | &#10006 |  | The name of the data sources to publish the data of in the order their data will be published |
| `Sessions[].Publishers[].DataSourceNames[]` | `String` | &#10006 |  |  |
| `Sessions[].Publishers[].DataSourcePatterns` | `Array | Null | String` | &#10006 |  | Patterns of the names of data sources to publish the data of off |
| `Sessions[].Publishers[].DataSourcePatterns[]` | `String` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies` | `Array | String` | &#10006 |  | List of policies to use when communicating with this action's protocol |
| `Sessions[].Publishers[].Policies[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance` | `Object | String` | &#10006 |  | This policy executes actions in separate stages, each stage has a rate in which to execute the actions included in it and a count or timeout to know after how many actions or after how much time to end the stage and move to the next. |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages` | `Array | String` | &#10004 |  | The stages of publishing information, in each stage the messages will be publishedwith a given rate untill 'Amount' messages are generated or untill 'TimeoutMs' is reached |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].Rate` | `Number | String` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].Amount` | `Integer | Null | String` | &#10006 |  | The number of times to perform action |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].TimeoutMs` | `Integer | Null | String` | &#10006 |  | The time in milliseconds before stopping the communication action |
| `Sessions[].Publishers[].Policies[].Count` | `Object | String` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].Count.Count` | `Integer | String` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance` | `Object | String` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed and increasing it overtime |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.MaxRate` | `Integer | String` | &#10004 |  | The maximum amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.StartRate` | `Integer | String` | &#10004 |  | The initial amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.RateIncrease` | `Integer | Null | String` | &#10006 | 1 | How much to increase the rate every RateIncreaseIntervalMs |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.RateIncreaseIntervalMs` | `Number | String` | &#10006 | 1000 | How often to increase the rate by RateIncrease in milliseconds |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Publishers[].Policies[].LoadBalance` | `Object | String` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed |
| `Sessions[].Publishers[].Policies[].LoadBalance.Rate` | `Number | String` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Publishers[].Policies[].LoadBalance.TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Publishers[].Policies[].Timeout` | `Object | String` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].Timeout.TimeoutMs` | `Integer | String` | &#10006 |  |  |
| `Sessions[].Publishers[].Chunk` | `Object | String` | &#10006 |  | Determines whether the publisher acts as a chunk publisher |
| `Sessions[].Publishers[].Chunk.ChunkSize` | `Integer | String` | &#10004 |  | The size of the chunk to use |
| `Sessions[].Publishers[].DataFilter` | `Object | String` | &#10006 |  | How to filter the properties of each returned published data |
| `Sessions[].Publishers[].DataFilter.Body` | `Boolean | String` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Publishers[].DataFilter.MetaData` | `Boolean | String` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Publishers[].DataFilter.Timestamp` | `Boolean | String` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Publishers[].ElasticIndex` | `Object | String` | &#10006 |  | Publishes documents to an elastic index |
| `Sessions[].Publishers[].ElasticIndex.IndexName` | `String` | &#10004 |  | Name of the index to publish documents to. if the index doesn't exist, it will create the index |
| `Sessions[].Publishers[].ElasticIndex.Password` | `String` | &#10004 |  | The password of the elasticsearch |
| `Sessions[].Publishers[].ElasticIndex.Url` | `String` | &#10004 |  | The url of the elasticsearch |
| `Sessions[].Publishers[].ElasticIndex.Username` | `String` | &#10004 |  | The username of the elasticsearch |
| `Sessions[].Publishers[].ElasticIndex.BatchSize` | `Integer | Null | String` | &#10006 |  | Batch size of publishing actions to the elastic index, when configured to null all generation data is considered as one batch |
| `Sessions[].Publishers[].ElasticIndex.PublishAsync` | `Boolean | String` | &#10006 | False | Whether to publish to elastic asynchronously (faster but dosen't publish by the given order) |
| `Sessions[].Publishers[].ElasticIndex.RequestTimeoutMs` | `Integer | String` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |
| `Sessions[].Publishers[].KafkaTopic` | `Object | String` | &#10006 |  | Publishes messages to a kafka topic |
| `Sessions[].Publishers[].KafkaTopic.Password` | `String` | &#10004 |  | Kafka Service with read permissions for the topic's password |
| `Sessions[].Publishers[].KafkaTopic.TopicName` | `String` | &#10004 |  | Name of the topic to read messages from |
| `Sessions[].Publishers[].KafkaTopic.Username` | `String` | &#10004 |  | Kafka Service with read permissions for the topic's username |
| `Sessions[].Publishers[].KafkaTopic.CompressionLevel` | `Integer | String` | &#10006 |  | Compression level for selected CompressionType algorithm, higher values will result in better compression at the cost of more CPU usage. |
| `Sessions[].Publishers[].KafkaTopic.CompressionType` | `enum [None / Gzip / Snappy / Lz4 / Zstd]` | &#10006 |  | Compression type to use before sending messages |
| `Sessions[].Publishers[].KafkaTopic.DefaultKafkaKey` | `Null | String` | &#10006 |  | The default kafka message key given if no key is given in the generated data under `MetaData` in the kafka key field |
| `Sessions[].Publishers[].KafkaTopic.Headers` | `Null | Object | String` | &#10006 |  | Default Headers to send messages with, if the message doesn't contain any Headers in its MetaData these Headers are used |
| `Sessions[].Publishers[].KafkaTopic.MessageSendMaxRetries` | `Integer | String` | &#10006 | 10 | Max amount of retries when message send to Kafka Topic failed. |
| `Sessions[].Publishers[].KafkaTopic.MessageSendRetriesIntervalMs` | `Integer | String` | &#10006 | 1000 | Time interval in milliseconds to wait between each retry of Kafka Topic message send. |
| `Sessions[].Publishers[].KafkaTopic.Partition` | `Integer | String` | &#10006 | -1 | The Kafka partition to produce to, by default -1 is treated as Partition.Any which will mean it uses an unspecified / unknown partition. |
| `Sessions[].Publishers[].KafkaTopic.QueueBufferingBackpressureThreshold` | `Integer | String` | &#10006 | 1 | The threshold of outstanding not yet transmitted broker requests needed to backpressure the producer's message accumulator. |
| `Sessions[].Publishers[].KafkaTopic.QueueBufferingMaxKbytes` | `Integer | String` | &#10006 | 1048576 | Maximum total message size sum allowed on the inner producer queue. |
| `Sessions[].Publishers[].KafkaTopic.QueueBufferingMaxMessages` | `Integer | String` | &#10006 | 100000 | Maximum number of messages allowed on the inner producer queue. A value of 0 disables this limit. |
| `Sessions[].Publishers[].KafkaTopic.SaslMechanism` | `enum [Gssapi / Plain / ScramSha256 / ScramSha512 / OAuthBearer]` | &#10006 |  | The Sasl mechanism used in the kafka |
| `Sessions[].Publishers[].KafkaTopic.SecurityProtocol` | `enum [Plaintext / Ssl / SaslPlaintext / SaslSsl]` | &#10006 |  | The Sasl's security protocol |
| `Sessions[].Publishers[].KafkaTopic.HostNames` | `Array | String` | &#10004 |  | List of the kafka hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `Sessions[].Publishers[].KafkaTopic.HostNames[]` | `String` | &#10006 |  |  |
| `Sessions[].Publishers[].MongoDbCollection` | `Object | String` | &#10006 |  | Publishes messages to an MongoDb collection |
| `Sessions[].Publishers[].MongoDbCollection.CollectionName` | `String` | &#10004 |  | The collection to insert data to |
| `Sessions[].Publishers[].MongoDbCollection.ConnectionString` | `String` | &#10004 |  | The connection string to the MongoDb server |
| `Sessions[].Publishers[].MongoDbCollection.DatabaseName` | `String` | &#10004 |  | The DB to insert data to |
| `Sessions[].Publishers[].MsSqlTable` | `Object | String` | &#10006 |  | Publishes messages to an mssql database table |
| `Sessions[].Publishers[].MsSqlTable.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `Sessions[].Publishers[].MsSqlTable.TableName` | `String` | &#10004 |  | The table to insert data to |
| `Sessions[].Publishers[].MsSqlTable.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Publishers[].MsSqlTable.IsUDTInsertion` | `Boolean | String` | &#10006 | False | Determines whether User-Defined Type (UDT) insertion is required. If UDT insertion is not necessary, it is recommended to set this property to false. UDT insertion can slow down data insertion, especially for large datasets. Therefore, it is recommended to only use UDT insertion when necessary. |
| `Sessions[].Publishers[].OracleSqlTable` | `Object | String` | &#10006 |  | Publishes messages to an oracle sql database table |
| `Sessions[].Publishers[].OracleSqlTable.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `Sessions[].Publishers[].OracleSqlTable.TableName` | `String` | &#10004 |  | The table to insert data to |
| `Sessions[].Publishers[].OracleSqlTable.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Publishers[].Parallel` | `Object | String` | &#10006 |  | Whether to publish in a specified parallelism |
| `Sessions[].Publishers[].Parallel.Parallelism` | `Integer | String` | &#10004 |  | The amount of parallel tasks to execute at once |
| `Sessions[].Publishers[].PostgreSqlTable` | `Object | String` | &#10006 |  | Publishes messages to a postgresql database table |
| `Sessions[].Publishers[].PostgreSqlTable.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `Sessions[].Publishers[].PostgreSqlTable.TableName` | `String` | &#10004 |  | The table to insert data to |
| `Sessions[].Publishers[].PostgreSqlTable.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Publishers[].RabbitMq` | `Object | String` | &#10006 |  | Publishes messages to a rabbitmq |
| `Sessions[].Publishers[].RabbitMq.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `Sessions[].Publishers[].RabbitMq.ContentType` | `Null | String` | &#10006 |  | Default ContentType to send messages with, if the message doesn't contain ContentType in its MetaData this one is Used |
| `Sessions[].Publishers[].RabbitMq.ContinuationTimeoutSeconds` | `Integer | String` | &#10006 | 5 | Amount of time protocol operations (e.g. queue.declare) are allowed to take before timing out in seconds |
| `Sessions[].Publishers[].RabbitMq.ExchangeName` | `Null | String` | &#10006 |  | Name of the exchange to send messages toCannot be set if configured QueueName to read from. |
| `Sessions[].Publishers[].RabbitMq.Expiration` | `Null | String` | &#10006 |  | Default Message expiration duration to send messages with, if the message doesn't contain any Expiration in its MetaData this Expiration is used |
| `Sessions[].Publishers[].RabbitMq.HandshakeContinuationTimeoutSeconds` | `Integer | String` | &#10006 | 10 | Amount of time protocol handshake operations are allowed to take before timing out in seconds |
| `Sessions[].Publishers[].RabbitMq.Headers` | `Null | Object | String` | &#10006 |  | Default Headers to send messages with, if the message doesn't contain any Headers in its MetaData these Headers are used |
| `Sessions[].Publishers[].RabbitMq.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `Sessions[].Publishers[].RabbitMq.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `Sessions[].Publishers[].RabbitMq.QueueName` | `Null | String` | &#10006 |  | Name of the queue to send messages to. Cannot be set if configured ExchangeName to read from. |
| `Sessions[].Publishers[].RabbitMq.RequestedConnectionTimeoutSeconds` | `Integer | String` | &#10006 | 5 | Timeout setting for connection attempts in seconds |
| `Sessions[].Publishers[].RabbitMq.RoutingKey` | `String` | &#10006 | / | Default routing key to send mesages to the exchange with, if the message doesn't contain any RoutingKey in its MetaData this routing key is used |
| `Sessions[].Publishers[].RabbitMq.Type` | `Null | String` | &#10006 |  | Default Type to send messages with, if the message doesn't contain Type in its MetaData this one is Used |
| `Sessions[].Publishers[].RabbitMq.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `Sessions[].Publishers[].RabbitMq.VirtualHost` | `String` | &#10006 | / | Rabbitmq virual host to access during this connection |
| `Sessions[].Publishers[].Redis` | `Object | String` | &#10006 |  | Publishes messages to a redis cache |
| `Sessions[].Publishers[].Redis.RedisDataType` | `enum [SetString / ListLeftPush / ListRightPush / SetAdd / HashSet / SortedSetAdd / GeoAdd]` | &#10004 |  | Redis data type to use, define the function the qaas will use to send to the redis server |
| `Sessions[].Publishers[].Redis.AbortOnConnectFail` | `Boolean | String` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `Sessions[].Publishers[].Redis.AsyncTimeout` | `Integer | String` | &#10006 | 5000 | Time(ms) to allow for asynchronous operations |
| `Sessions[].Publishers[].Redis.BatchSize` | `Integer | Null | String` | &#10006 |  | Batch size of sending actions to the redis, when configured to null all generation data is considred as one batch |
| `Sessions[].Publishers[].Redis.ClientName` | `Null | String` | &#10006 |  | Identification for the connection within redis |
| `Sessions[].Publishers[].Redis.CommandFlags` | `enum [None / PreferMaster / HighPriority / FireAndForget / DemandMaster / PreferSlave / PreferReplica / DemandSlave / DemandReplica / NoRedirect / NoScriptCache]` | &#10006 |  | Specifies the command flags that should be performed, behaviour markers associated with a given command |
| `Sessions[].Publishers[].Redis.ConnectRetry` | `Integer | String` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `Sessions[].Publishers[].Redis.KeepAlive` | `Integer | String` | &#10006 | 60 | Time (seconds) at which to send a message to help keep alive |
| `Sessions[].Publishers[].Redis.Password` | `Null | String` | &#10006 |  | Password for the redis server |
| `Sessions[].Publishers[].Redis.RedisDataBase` | `Integer | String` | &#10006 | 0 | Redis database to use |
| `Sessions[].Publishers[].Redis.Retries` | `Integer | String` | &#10006 | 1 | How many times to retry when failing to send an item, before crash |
| `Sessions[].Publishers[].Redis.RetryIntervalMs` | `Integer | String` | &#10006 | 1000 | Retries interval milliseconds |
| `Sessions[].Publishers[].Redis.Ssl` | `Boolean | String` | &#10006 | False | Specifies that SSL encryption should be used |
| `Sessions[].Publishers[].Redis.SslHost` | `Null | String` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `Sessions[].Publishers[].Redis.Username` | `Null | String` | &#10006 |  | User for the redis server |
| `Sessions[].Publishers[].Redis.When` | `enum [Always / Exists / NotExists]` | &#10006 |  | Indicates when this operation should be performed (only some variations are legal in a given context) |
| `Sessions[].Publishers[].Redis.HostNames` | `Array | String` | &#10004 |  | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `Sessions[].Publishers[].Redis.HostNames[]` | `String` | &#10006 |  |  |
| `Sessions[].Publishers[].S3Bucket` | `Object | String` | &#10006 |  | Publishes messages to an S3 bucket |
| `Sessions[].Publishers[].S3Bucket.AccessKey` | `String` | &#10004 |  | S3 account access key |
| `Sessions[].Publishers[].S3Bucket.SecretKey` | `String` | &#10004 |  | S3 account secret access key |
| `Sessions[].Publishers[].S3Bucket.ServiceURL` | `String` | &#10004 |  | S3 service url |
| `Sessions[].Publishers[].S3Bucket.StorageBucket` | `String` | &#10004 |  | Name of S3 bucket |
| `Sessions[].Publishers[].S3Bucket.ForcePathStyle` | `Boolean | String` | &#10006 | True | When true, requests will always use path style addressing |
| `Sessions[].Publishers[].S3Bucket.Prefix` | `String` | &#10006 |  | The object's naming prefix |
| `Sessions[].Publishers[].S3Bucket.Retries` | `Integer | Null | String` | &#10006 |  | The number of times to retry sending to S3 in case the s3 maximum IO is reached |
| `Sessions[].Publishers[].S3Bucket.S3SentObjectsNaming` | `enum [GrowingNumericalSeries / RandomGuid]` | &#10006 |  | The naming type of the object naming generator |
| `Sessions[].Publishers[].S3Bucket.S3StorageClass` | `enum [DeepArchive / Glacier / GlacierInstantRetrieval / IntelligentTiering / OneZoneInfrequentAccess / Outposts / ReducedRedundancy / Standard / StandardInfrequentAccess]` | &#10006 |  | S3 Storage Class Definitions. Options:[`Glacier` - The GLACIER storage is for object that are stored in Amazon Glacier. This storage class is for objects that are for archival purpose and get operations are rare.  Durability 99.999999999 / `Outposts` - The OUTPOSTS storage class for objects stored in a S3 Outpost / `Standard` - The STANDARD storage class, which is the default storage class for S3.  Durability 99.999999999%; Availability 99.99% over a given year/ `DeepArchive` - S3 Glacier Deep Archive provides secure, durable object storage class for long term data archival. It is the ideal storage class to make an archival, durable copy of data that rarely, if ever, needs to be accessed. It can be used as an offline backup for their most important data assets and to meet long-term retention needs. / `IntelligentTiering - IntelligentTiering makes it easy to lower your overall cost of storage by automatically placing data in the storage class that best matches the access patterns for the storage. With IntelligentTiering, you don’t need to define and manage individual policies for lifecycle data management or write code to transition objects between storage classes. Instead, you can use IntelligentTiering to manage transitions between Standard and S-IA without writing any application code. IntelligentTiering also manages transitions automatically to Glacier for long term archive in addition to S3 storage classes.` / `ReducedRedundancy` - REDUCED_REDUNDANCY provides the same availability as standard, but at a lower durability.  Durability 99.99%; Availability 99.99% over a given year. / `GlacierInstantRetrieval` - Constant GLACIER_IR for ObjectStorageClass / `StandardInfrequentAccess` - The STANDARD_IA storage is for infrequently accessed objects. This storage class is for objects that are long-lived and less frequently accessed, like backups and older data.  Durability 99.999999999%; Availability 99.9% over a given year. / `OneZoneInfrequentAccess` - The ONEZONE_IA storage is for infrequently accessed objects. It is similiar to STANDARD_IA, but only stores object data within one Availablity Zone in a given region.  Durability 99.999999999%; Availability 99% over a given year.] |
| `Sessions[].Publishers[].Serialize` | `Object | String` | &#10006 |  | The serializer to use to serialize the data to publish |
| `Sessions[].Publishers[].Serialize.Serializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers |
| `Sessions[].Publishers[].Sftp` | `Object | String` | &#10006 |  | Publishes files to a remote machine using SFTP |
| `Sessions[].Publishers[].Sftp.Hostname` | `String` | &#10004 |  | The hostname of the remote machine |
| `Sessions[].Publishers[].Sftp.Password` | `String` | &#10004 |  | The password for accessing the remote machine |
| `Sessions[].Publishers[].Sftp.Path` | `String` | &#10004 |  | The path of the relevant directory in the remote machine |
| `Sessions[].Publishers[].Sftp.Username` | `String` | &#10004 |  | The username for accessing the remote machine |
| `Sessions[].Publishers[].Sftp.NamingType` | `enum [GrowingNumericalSeries / RandomGuid]` | &#10006 |  | The naming type of the object naming generator |
| `Sessions[].Publishers[].Sftp.Port` | `Integer | String` | &#10006 | 22 | The port in the remote machine |
| `Sessions[].Publishers[].Sftp.Prefix` | `String` | &#10006 |  | The object's naming prefix |
| `Sessions[].Publishers[].Socket` | `Object | String` | &#10006 |  | Publishes messages from a socket to an endpoint |
| `Sessions[].Publishers[].Socket.Host` | `String` | &#10004 |  | Socket connection endpoint hostname |
| `Sessions[].Publishers[].Socket.Port` | `Integer | String` | &#10004 |  | Socket connection endpoint port |
| `Sessions[].Publishers[].Socket.ProtocolType` | `enum [IP / IPv6HopByHopOptions / Unspecified / Icmp / Igmp / Ggp / IPv4 / Tcp / Pup / Udp / Idp / IPv6 / IPv6RoutingHeader / IPv6FragmentHeader / IPSecEncapsulatingSecurityPayload / IPSecAuthenticationHeader / IcmpV6 / IPv6NoNextHeader / IPv6DestinationOptions / ND / Raw / Ipx / Spx / SpxII / Unknown]` | &#10004 |  | Specifies the protocol to use in the socket |
| `Sessions[].Publishers[].Socket.AddressFamily` | `enum [Unspecified / Unix / InterNetwork / ImpLink / Pup / Chaos / NS / Ipx / Iso / Osi / Ecma / DataKit / Ccitt / Sna / DecNet / DataLink / Lat / HyperChannel / AppleTalk / NetBios / VoiceView / FireFox / Banyan / Atm / InterNetworkV6 / Cluster / Ieee12844 / Irda / NetworkDesigners / Max / Packet / ControllerAreaNetwork / Unknown]` | &#10006 |  | Specifies the addressing scheme to use in the socket |
| `Sessions[].Publishers[].Socket.BufferSize` | `Integer | String` | &#10006 | 65536 | The size of the send buffer, in bytes. Increasing it can improve sending speed substantially but will use more memory.To achieve max speed the buffer needs to be the size of all sent data combined |
| `Sessions[].Publishers[].Socket.LingerTimeSeconds` | `Integer | Null | String` | &#10006 |  | the number of seconds to remain connected after sending all the data, null means it does not remain connected after sending the data. |
| `Sessions[].Publishers[].Socket.NagleAlgorithm` | `Boolean | String` | &#10006 | False | Whether to use the Nagle Algorithm (true) or not(false). The Nagle algorithm is a method used in TCP/IP networks to improve the efficiency of data transmission. It's designed to reduce the number of small packets that are sent over the network.The Nagle algorithm is designed to improve the efficiency of small packets, but it can sometimes cause delays in the transmission of large packets. |
| `Sessions[].Publishers[].Socket.SendTimeoutMs` | `Integer | String` | &#10006 | 5000 | socket's timeout sending a packet in milliseconds |
| `Sessions[].Publishers[].Socket.SocketType` | `enum [Stream / Dgram / Raw / Rdm / Seqpacket / Unknown]` | &#10006 |  | Specifies the type of socket |
| `Sessions[].Stages` | `Array | String` | &#10006 |  | Optional per-stage configuration for the session's internal action stages. Use this to override timing around a specific stage number without changing the action order. |
| `Sessions[].Stages[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Stages[].StageNumber` | `Integer | String` | &#10006 |  | The internal session stage number this configuration applies to. |
| `Sessions[].Stages[].TimeoutAfter` | `Integer | Null | String` | &#10006 |  | Optional time in milliseconds to wait after this internal session stage completes. |
| `Sessions[].Stages[].TimeoutBefore` | `Integer | Null | String` | &#10006 |  | Optional time in milliseconds to wait before starting this internal session stage. |
| `Sessions[].Transactions` | `Array | Null | String` | &#10006 |  | List of all transactions to run build and for this session. Transactions iterate over data and use protocols to send it to the http applications, while saving the response data |
| `Sessions[].Transactions[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Transactions[].Name` | `String` | &#10004 |  | The communication action's name which acts as a unique identifier, used as the name of the communication action's produced input/output |
| `Sessions[].Transactions[].TimeoutMs` | `Integer | String` | &#10004 |  | the consumption timeout in milliseconds (timeout is the time to wait for a response after sending a request) |
| `Sessions[].Transactions[].Iterations` | `Integer | String` | &#10006 | 1 | How much iterations of the publishing action to execute |
| `Sessions[].Transactions[].Loop` | `Boolean | String` | &#10006 | False | Whether to publish in loop |
| `Sessions[].Transactions[].SleepTimeMs` | `Integer | String` | &#10006 | 0 | The time to sleep in milliseconds in between iterations |
| `Sessions[].Transactions[].Stage` | `Integer | String` | &#10006 | 2 | The stage in which the Transaction runs at |
| `Sessions[].Transactions[].DataSourceNames` | `Array | Null | String` | &#10006 |  | The name of the data sources to publish the data of in the order their data will be published |
| `Sessions[].Transactions[].DataSourceNames[]` | `String` | &#10006 |  |  |
| `Sessions[].Transactions[].DataSourcePatterns` | `Array | Null | String` | &#10006 |  | Patterns of the names of data sources to publish the data of off |
| `Sessions[].Transactions[].DataSourcePatterns[]` | `String` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies` | `Array | String` | &#10006 |  | List of policies to use when communicating with this action's protocol |
| `Sessions[].Transactions[].Policies[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance` | `Object | String` | &#10006 |  | This policy executes actions in separate stages, each stage has a rate in which to execute the actions included in it and a count or timeout to know after how many actions or after how much time to end the stage and move to the next. |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages` | `Array | String` | &#10004 |  | The stages of publishing information, in each stage the messages will be publishedwith a given rate untill 'Amount' messages are generated or untill 'TimeoutMs' is reached |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[]` | `Object | String` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].Rate` | `Number | String` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].Amount` | `Integer | Null | String` | &#10006 |  | The number of times to perform action |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Transactions[].Policies[].AdvancedLoadBalance.Stages[].TimeoutMs` | `Integer | Null | String` | &#10006 |  | The time in milliseconds before stopping the communication action |
| `Sessions[].Transactions[].Policies[].Count` | `Object | String` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].Count.Count` | `Integer | String` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance` | `Object | String` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed and increasing it overtime |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.MaxRate` | `Integer | String` | &#10004 |  | The maximum amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.StartRate` | `Integer | String` | &#10004 |  | The initial amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.RateIncrease` | `Integer | Null | String` | &#10006 | 1 | How much to increase the rate every RateIncreaseIntervalMs |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.RateIncreaseIntervalMs` | `Number | String` | &#10006 | 1000 | How often to increase the rate by RateIncrease in milliseconds |
| `Sessions[].Transactions[].Policies[].IncreasingLoadBalance.TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Transactions[].Policies[].LoadBalance` | `Object | String` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed |
| `Sessions[].Transactions[].Policies[].LoadBalance.Rate` | `Number | String` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Transactions[].Policies[].LoadBalance.TimeIntervalMs` | `Integer | String` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Transactions[].Policies[].Timeout` | `Object | String` | &#10006 |  |  |
| `Sessions[].Transactions[].Policies[].Timeout.TimeoutMs` | `Integer | String` | &#10006 |  |  |
| `Sessions[].Transactions[].Grpc` | `Object | String` | &#10006 |  | Invokes a Grpc Method |
| `Sessions[].Transactions[].Grpc.AssemblyName` | `String` | &#10004 |  | The name of the assembly the grpc protos are defined in |
| `Sessions[].Transactions[].Grpc.Host` | `String` | &#10004 |  | Grpc server host |
| `Sessions[].Transactions[].Grpc.Port` | `Integer | String` | &#10004 |  | Grpc server port |
| `Sessions[].Transactions[].Grpc.ProtoNameSpace` | `String` | &#10004 |  | The namespace the grpc protos are defined in |
| `Sessions[].Transactions[].Grpc.RpcName` | `String` | &#10004 |  | The name of the rpc to invoke |
| `Sessions[].Transactions[].Grpc.ServiceName` | `String` | &#10004 |  | The name of the service the rpc is defined in |
| `Sessions[].Transactions[].Http` | `Object | String` | &#10006 |  | Sends an http request |
| `Sessions[].Transactions[].Http.BaseAddress` | `String` | &#10004 |  | The http server's address (needs to be with the protocol specification prefix http:// or https://) |
| `Sessions[].Transactions[].Http.Method` | `enum [Post / Put / Get / Delete]` | &#10004 |  | The http method the transactor should perform |
| `Sessions[].Transactions[].Http.Headers` | `Null | Object | String` | &#10006 |  | Default content headers to add to the http requests, will be overriden if sent data has http content headers in its metadata |
| `Sessions[].Transactions[].Http.MessageSendRetriesIntervalMs` | `Integer | String` | &#10006 | 1000 | Time interval in milliseconds to wait between each retry of http request. |
| `Sessions[].Transactions[].Http.Port` | `Integer | Null | String` | &#10006 | 8080 | The port to send the requests to in the http server |
| `Sessions[].Transactions[].Http.RequestHeaders` | `Null | Object | String` | &#10006 |  | Default request headers to add to the http requests, will be overriden if sent data has http request headers in its metadata |
| `Sessions[].Transactions[].Http.Retries` | `Integer | String` | &#10006 | 1 | The amount of times to retry each failed request |
| `Sessions[].Transactions[].Http.Route` | `String` | &#10006 |  | The route in the http server to send the request to |
| `Sessions[].Transactions[].Http.JwtAuth` | `Object | String` | &#10006 |  | The JWT configurations for the generation and addition of a JWT as a Bearer authorization header, if this field is not configured will not use JwtAuth |
| `Sessions[].Transactions[].Http.JwtAuth.Secret` | `String` | &#10004 |  | The JWT secret |
| `Sessions[].Transactions[].Http.JwtAuth.BuildJwtConfig` | `Boolean | String` | &#10006 | True | Whether to build JWT config with claims or send the Secret value as the auth token |
| `Sessions[].Transactions[].Http.JwtAuth.Claims` | `Object | String` | &#10006 |  | Custom claims of the JWT |
| `Sessions[].Transactions[].Http.JwtAuth.HierarchicalClaims` | `Null | String` | &#10006 |  | Custom Hierarchical claims of the JWT, Must be a string in yaml format. When set to a non null value the Claims field will be ignored and this will be used instead. |
| `Sessions[].Transactions[].Http.JwtAuth.HttpAuthScheme` | `enum [Bearer / Basic / Digest / JWT / ApiKey / Token]` | &#10006 |  | The authorization scheme to use |
| `Sessions[].Transactions[].Http.JwtAuth.JwtAlgorithm` | `enum [HMACSHA256Algorithm]` | &#10006 |  | The JWT Algorithm algorithm used |
| `Sessions[].Transactions[].InputDataFilter` | `Object | String` | &#10006 |  | How to filter the properties of each returned sent (input) data |
| `Sessions[].Transactions[].InputDataFilter.Body` | `Boolean | String` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].InputDataFilter.MetaData` | `Boolean | String` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].InputDataFilter.Timestamp` | `Boolean | String` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].InputSerialize` | `Object | String` | &#10006 |  | The serializer to use to serialize the sent data |
| `Sessions[].Transactions[].InputSerialize.Serializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers |
| `Sessions[].Transactions[].OutputDataFilter` | `Object | String` | &#10006 |  | How to filter the properties of each returned received (output) data |
| `Sessions[].Transactions[].OutputDataFilter.Body` | `Boolean | String` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].OutputDataFilter.MetaData` | `Boolean | String` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].OutputDataFilter.Timestamp` | `Boolean | String` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Transactions[].OutputDeserialize` | `Object | String` | &#10006 |  | The deserializer to use to deserialize the received data |
| `Sessions[].Transactions[].OutputDeserialize.Deserializer` | `enum [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].Transactions[].OutputDeserialize.SpecificType` | `Object | String` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].Transactions[].OutputDeserialize.SpecificType.TypeFullName` | `String` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].Transactions[].OutputDeserialize.SpecificType.AssemblyName` | `Null | String` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
