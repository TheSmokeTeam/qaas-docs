# Consumers Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions[].Consumers` | `list or string or null` | &#10006 |  | List of all consumers to build and run for this session. Consumers use protocols to receive data from the application |
| `Sessions[].Consumers[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Consumers[].Name` | `string` | &#10004 |  | The name of the consumer |
| `Sessions[].Consumers[].TimeoutMs` | `integer or string` | &#10004 |  | The consumption timeout in milliseconds (timeout is the time since last message was read by the consumer) |
| `Sessions[].Consumers[].Configuration` | `object or string` | &#10006 |  |  |
| `Sessions[].Consumers[].Stage` | `integer or string` | &#10006 | 0 | The stage in which the Consumer runs at |
| `Sessions[].Consumers[].Policies` | `list or string` | &#10006 |  | List of policies to use when communicating with this action's protocol |
| `Sessions[].Consumers[].Policies[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance` | `object or string` | &#10006 |  | This policy executes actions in separate stages, each stage has a rate in which to execute the actions included in it and a count or timeout to know after how many actions or after how much time to end the stage and move to the next. |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages` | `list or string or null` | &#10006 |  | The stages of publishing information, in each stage the messages will be publishedwith a given rate untill 'Amount' messages are generated or untill 'TimeoutMs' is reached |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].Rate` | `number or string` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].Amount` | `integer or string or null` | &#10006 |  | The number of times to perform action |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Consumers[].Policies[].AdvancedLoadBalance.Stages[].TimeoutMs` | `integer or string or null` | &#10006 |  | The time in milliseconds before stopping the communication action |
| `Sessions[].Consumers[].Policies[].Count` | `object or string` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].Count.Count` | `integer or string` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance` | `object or string` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed and increasing it overtime |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.MaxRate` | `integer or string` | &#10004 |  | The maximum amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.StartRate` | `integer or string` | &#10004 |  | The initial amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.RateIncrease` | `integer or string or null` | &#10006 | 1 | How much to increase the rate every RateIncreaseIntervalMs |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.RateIncreaseIntervalMs` | `number or string` | &#10006 | 1000 | How often to increase the rate by RateIncrease in milliseconds |
| `Sessions[].Consumers[].Policies[].IncreasingLoadBalance.TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Consumers[].Policies[].LoadBalance` | `object or string` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed |
| `Sessions[].Consumers[].Policies[].LoadBalance.Rate` | `number or string` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Consumers[].Policies[].LoadBalance.TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Consumers[].Policies[].Timeout` | `object or string` | &#10006 |  |  |
| `Sessions[].Consumers[].Policies[].Timeout.TimeoutMs` | `integer or string` | &#10006 |  |  |
| `Sessions[].Consumers[].DataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned consumed data |
| `Sessions[].Consumers[].DataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Consumers[].DataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Consumers[].DataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Consumers[].Deserialize` | `object or string` | &#10006 |  | Serializer to use to deserialize the consumed data |
| `Sessions[].Consumers[].Deserialize.Deserializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The deserializer type to use for deserializing. Null means no deserialization will happen. Options are all available `QaaS.Framework.Serialization` deserializers |
| `Sessions[].Consumers[].Deserialize.SpecificType` | `object or string` | &#10006 |  | Configuration for making deserializer deserialize into a specific C# object, if set to null will deserialize to default deserilizer's C# object |
| `Sessions[].Consumers[].Deserialize.SpecificType.TypeFullName` | `string` | &#10004 |  | The full name (including path) of the type |
| `Sessions[].Consumers[].Deserialize.SpecificType.AssemblyName` | `string or null` | &#10006 |  | The name of the assembly the type is located in, If no value is given by default tries to take the entry assembly |
| `Sessions[].Consumers[].ElasticIndices` | `object or string` | &#10006 |  | Consumes documents from elasticsearch indices by an index pattern |
| `Sessions[].Consumers[].ElasticIndices.IndexPattern` | `string` | &#10004 |  | The index pattern of the relevant indices |
| `Sessions[].Consumers[].ElasticIndices.Password` | `string` | &#10004 |  | The password of the elasticsearch |
| `Sessions[].Consumers[].ElasticIndices.Url` | `string` | &#10004 |  | The url of the elasticsearch |
| `Sessions[].Consumers[].ElasticIndices.Username` | `string` | &#10004 |  | The username of the elasticsearch |
| `Sessions[].Consumers[].ElasticIndices.FilterSecondsBeforeRunStartTime` | `integer or string` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start consuming messages in seconds |
| `Sessions[].Consumers[].ElasticIndices.MatchQueryString` | `string` | &#10006 | * | The match query string for the documents from the relevant indices |
| `Sessions[].Consumers[].ElasticIndices.ReadBatchSize` | `integer or string` | &#10006 | 1000 | The size of the batch of documents to read from the elastic index pattern while scrolling its contents |
| `Sessions[].Consumers[].ElasticIndices.ReadFromRunStartTime` | `string or true/false` | &#10006 | False | Whether to only read messages that arrived to the elastic after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].ElasticIndices.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |
| `Sessions[].Consumers[].ElasticIndices.ScrollContextExpirationMs` | `integer or string` | &#10006 | 100000 | Specify how long a consistent view of the index should be maintained for scrolled search in milliseconds |
| `Sessions[].Consumers[].ElasticIndices.TimestampField` | `string` | &#10006 | @timestamp | The json path to the main timestamp field to use for deciding a queried item's latest update time |
| `Sessions[].Consumers[].IbmMqQueue` | `object or string` | &#10006 |  | Consumes messages from IbmMq queue |
| `Sessions[].Consumers[].IbmMqQueue.Channel` | `string` | &#10004 |  | The name of the channel to connect to |
| `Sessions[].Consumers[].IbmMqQueue.HostName` | `string` | &#10004 |  | The name of the host machine hosting the IbmMq |
| `Sessions[].Consumers[].IbmMqQueue.Manager` | `string` | &#10004 |  | The name of the IbmMq manager to connect to |
| `Sessions[].Consumers[].IbmMqQueue.Port` | `integer or string` | &#10004 |  | The port number the IbmMq is listening on |
| `Sessions[].Consumers[].IbmMqQueue.QueueName` | `string` | &#10004 |  | Name of the queue to read messages from |
| `Sessions[].Consumers[].KafkaTopic` | `object or string` | &#10006 |  | Consumes messages from a kafka topic |
| `Sessions[].Consumers[].KafkaTopic.GroupId` | `string` | &#10004 |  | The group name to be used when reading messages |
| `Sessions[].Consumers[].KafkaTopic.Password` | `string` | &#10004 |  | Kafka Service with read permissions for the topic's password |
| `Sessions[].Consumers[].KafkaTopic.TopicName` | `string` | &#10004 |  | Name of the topic to read messages from |
| `Sessions[].Consumers[].KafkaTopic.Username` | `string` | &#10004 |  | Kafka Service with read permissions for the topic's username |
| `Sessions[].Consumers[].KafkaTopic.AutoOffsetReset` | `one of [Latest / Earliest / Error]` | &#10006 |  | Where the reader starts reading from in the topic when being created, latest means it starts reading only messages received after it started reading, other options such as Earliest can be found online. |
| `Sessions[].Consumers[].KafkaTopic.EnableAutoCommit` | `string or true/false` | &#10006 | True | Whether the read mechanism will commit the offsets automatically and periodically in the background. |
| `Sessions[].Consumers[].KafkaTopic.FetchMinBytes` | `integer or string` | &#10006 | 1 | Minimum number of bytes the broker responds with. If `FetchWaitMaxMs` expires the accumulated data will be sent to the client regardless of this setting. |
| `Sessions[].Consumers[].KafkaTopic.FetchWaitMaxMs` | `integer or string` | &#10006 | 2000 | Maximum time the broker may wait to fill the Fetch response with `FetchMinBytes` of messages. |
| `Sessions[].Consumers[].KafkaTopic.HeartbeatIntervalMs` | `integer or string` | &#10006 | 1000 | Group session keepalive heartbeat interval |
| `Sessions[].Consumers[].KafkaTopic.MaxPollIntervalMs` | `integer or string` | &#10006 | 15000 | Maximum allowed time between calls to read messages for high-level readers. If this interval is exceeded the reader is considered failed and the group will rebalance in order to reassign the partitions to another reader group member |
| `Sessions[].Consumers[].KafkaTopic.MessageMaxBytes` | `integer or string` | &#10006 | 1000000 | Maximum allowed Kafka message size in bytes. Must not exceed broker/topic limits. |
| `Sessions[].Consumers[].KafkaTopic.PartitionAssignmentStrategy` | `one of [Range / RoundRobin / CooperativeSticky]` | &#10006 |  | The name of a partition assignment strategy to use. The elected group leader will use a strategy supported by all members of the group to assign partitions to group members. Options: [ `CooperativeSticky` - Ensures that a reader retains its exsting partitions unless it fails, providing stability in partition ownership` / `Range` - Distributes partitions evenly across readers by assigning each reader a range of partitions / `RoundRobin` - Assigns partitions to readers in a circular order, distributing them sequentially ]  |
| `Sessions[].Consumers[].KafkaTopic.SaslMechanism` | `one of [Gssapi / Plain / ScramSha256 / ScramSha512 / OAuthBearer]` | &#10006 |  | The Sasl mechanism used in the kafka |
| `Sessions[].Consumers[].KafkaTopic.SecurityProtocol` | `one of [Plaintext / Ssl / SaslPlaintext / SaslSsl]` | &#10006 |  | The Sasl's security protocol |
| `Sessions[].Consumers[].KafkaTopic.SessionTimeOutMs` | `integer or string` | &#10006 | 9000 | The maximum amount of time in milliseconds the reader can go without sending a heartbeat to the reader group coordinator before its considered dead |
| `Sessions[].Consumers[].KafkaTopic.HostNames` | `list or string` | &#10004 |  | List of the kafka hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `Sessions[].Consumers[].KafkaTopic.HostNames[]` | `string` | &#10006 |  |  |
| `Sessions[].Consumers[].MsSqlTable` | `object or string` | &#10006 |  | Consume messages from an mssql database table |
| `Sessions[].Consumers[].MsSqlTable.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].MsSqlTable.TableName` | `string` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].MsSqlTable.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].MsSqlTable.FilterSecondsBeforeRunStartTime` | `integer or string` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].MsSqlTable.InsertionTimeField` | `string or null` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].MsSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `integer or string` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].MsSqlTable.ReadFromRunStartTime` | `string or true/false` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].MsSqlTable.WhereStatement` | `string or null` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].MsSqlTable.ColumnsToIgnore` | `list or string` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].MsSqlTable.ColumnsToIgnore[]` | `string` | &#10006 |  |  |
| `Sessions[].Consumers[].OracleSqlTable` | `object or string` | &#10006 |  | Consume messages from an oracle sql database table |
| `Sessions[].Consumers[].OracleSqlTable.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].OracleSqlTable.TableName` | `string` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].OracleSqlTable.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].OracleSqlTable.FilterSecondsBeforeRunStartTime` | `integer or string` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].OracleSqlTable.InsertionTimeField` | `string or null` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].OracleSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `integer or string` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].OracleSqlTable.ReadFromRunStartTime` | `string or true/false` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].OracleSqlTable.WhereStatement` | `string or null` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].OracleSqlTable.ColumnsToIgnore` | `list or string` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].OracleSqlTable.ColumnsToIgnore[]` | `string` | &#10006 |  |  |
| `Sessions[].Consumers[].PostgreSqlTable` | `object or string` | &#10006 |  | Consume messages from an postgresql database table |
| `Sessions[].Consumers[].PostgreSqlTable.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].PostgreSqlTable.TableName` | `string` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].PostgreSqlTable.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].PostgreSqlTable.FilterSecondsBeforeRunStartTime` | `integer or string` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].PostgreSqlTable.InsertionTimeField` | `string or null` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].PostgreSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `integer or string` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].PostgreSqlTable.IsInsertionTimeFieldTimeZoneTz` | `string or true/false` | &#10006 | False | Whether the InsertionTimeField is of type `timezonetz` (true) or not (false), if it is and this is configurd to true it will be treated as if its timezone is utc |
| `Sessions[].Consumers[].PostgreSqlTable.ReadFromRunStartTime` | `string or true/false` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].PostgreSqlTable.WhereStatement` | `string or null` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].PostgreSqlTable.ColumnsToIgnore` | `list or string` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].PostgreSqlTable.ColumnsToIgnore[]` | `string` | &#10006 |  |  |
| `Sessions[].Consumers[].RabbitMq` | `object or string` | &#10006 |  | Consumes messages from a rabbitmq |
| `Sessions[].Consumers[].RabbitMq.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `Sessions[].Consumers[].RabbitMq.ContinuationTimeoutSeconds` | `integer or string` | &#10006 | 5 | Amount of time protocol operations (e.g. queue.declare) are allowed to take before timing out in seconds |
| `Sessions[].Consumers[].RabbitMq.CreatedQueueTimeToExpireMs` | `number or string` | &#10006 | 300000 | The amount of milliseconds before the created queue is deleted when it has no readrs |
| `Sessions[].Consumers[].RabbitMq.ExchangeName` | `string or null` | &#10006 |  | Name of the exchange to read messages fromCannot be set if configured QueueName to read from. |
| `Sessions[].Consumers[].RabbitMq.HandshakeContinuationTimeoutSeconds` | `integer or string` | &#10006 | 10 | Amount of time protocol handshake operations are allowed to take before timing out in seconds |
| `Sessions[].Consumers[].RabbitMq.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `Sessions[].Consumers[].RabbitMq.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `Sessions[].Consumers[].RabbitMq.QueueName` | `string or null` | &#10006 |  | Name of the queue to read messages fromCannot be set if configured ExchangeName to read from. |
| `Sessions[].Consumers[].RabbitMq.RequestedConnectionTimeoutSeconds` | `integer or string` | &#10006 | 5 | Timeout setting for connection attempts in seconds |
| `Sessions[].Consumers[].RabbitMq.RoutingKey` | `string` | &#10006 | / | Routing key of messages to read |
| `Sessions[].Consumers[].RabbitMq.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `Sessions[].Consumers[].RabbitMq.VirtualHost` | `string` | &#10006 | / | Rabbitmq virual host to access during this connection |
| `Sessions[].Consumers[].S3Bucket` | `object or string` | &#10006 |  | Consumes messages from an s3 bucket |
| `Sessions[].Consumers[].S3Bucket.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `Sessions[].Consumers[].S3Bucket.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `Sessions[].Consumers[].S3Bucket.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `Sessions[].Consumers[].S3Bucket.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `Sessions[].Consumers[].S3Bucket.Delimiter` | `string` | &#10006 |  | Delimiter of the objects to read from s3 bucket, this determines what objects will be retrieved from the bucket, objects that have at least one occurence of the delimiter in their relative path after the `Prefix` will not be retrieved from the bucket. |
| `Sessions[].Consumers[].S3Bucket.ForcePathStyle` | `string or true/false` | &#10006 | True | When true, requests will always use path style addressing |
| `Sessions[].Consumers[].S3Bucket.MaximumRetryCount` | `integer or string or null` | &#10006 |  | The maximum number of times to retry when an action against the S3 fails due to maximum S3 supported IOPS, if no value is given will retry indefinitely |
| `Sessions[].Consumers[].S3Bucket.Prefix` | `string` | &#10006 |  | Prefix of the objects to read from s3 bucket |
| `Sessions[].Consumers[].S3Bucket.ReadFromRunStartTime` | `string or true/false` | &#10006 | False | Whether to only read messages that were last modified after the start of the read action (true) or read all messages regardless of latest modification time (false) |
| `Sessions[].Consumers[].S3Bucket.SkipEmptyObjects` | `string or true/false` | &#10006 | False | Whether to skip the read of empty s3 objects or not, if true skips them if false doesnt skip them |
| `Sessions[].Consumers[].Socket` | `object or string` | &#10006 |  | Consumes messages from socket communications in various protocols |
| `Sessions[].Consumers[].Socket.Host` | `string` | &#10004 |  | Socket connection endpoint hostname |
| `Sessions[].Consumers[].Socket.Port` | `integer or string` | &#10004 |  | Socket connection endpoint port |
| `Sessions[].Consumers[].Socket.ProtocolType` | `one of [IP / IPv6HopByHopOptions / Unspecified / Icmp / Igmp / Ggp / IPv4 / Tcp / Pup / Udp / Idp / IPv6 / IPv6RoutingHeader / IPv6FragmentHeader / IPSecEncapsulatingSecurityPayload / IPSecAuthenticationHeader / IcmpV6 / IPv6NoNextHeader / IPv6DestinationOptions / ND / Raw / Ipx / Spx / SpxII / Unknown]` | &#10004 |  | Specifies the protocol to use in the socket |
| `Sessions[].Consumers[].Socket.AddressFamily` | `one of [Unspecified / Unix / InterNetwork / ImpLink / Pup / Chaos / NS / Ipx / Iso / Osi / Ecma / DataKit / Ccitt / Sna / DecNet / DataLink / Lat / HyperChannel / AppleTalk / NetBios / VoiceView / FireFox / Banyan / Atm / InterNetworkV6 / Cluster / Ieee12844 / Irda / NetworkDesigners / Max / Packet / ControllerAreaNetwork / Unknown]` | &#10006 |  | Specifies the addressing scheme to use in the socket |
| `Sessions[].Consumers[].Socket.BufferSize` | `integer or string` | &#10006 | 65536 | Size of the receive buffer, in bytes |
| `Sessions[].Consumers[].Socket.ReceiveTimeoutMs` | `integer or string` | &#10006 | 5000 | Timeout receiving a packet in milliseconds |
| `Sessions[].Consumers[].Socket.SeperationChar` | `string or null` | &#10006 |  | Character to seperate read buffers into messages (delimiter) - when left blank - messages will be set by default buffer seperation |
| `Sessions[].Consumers[].Socket.SocketType` | `one of [Stream / Dgram / Raw / Rdm / Seqpacket / Unknown]` | &#10006 |  | Specifies the type of socket |
| `Sessions[].Consumers[].TrinoSqlTable` | `object or string` | &#10006 |  | Consume messages from a trino sql database table |
| `Sessions[].Consumers[].TrinoSqlTable.Catalog` | `string` | &#10004 |  | The catalog that the table name in it |
| `Sessions[].Consumers[].TrinoSqlTable.ClientTag` | `string` | &#10004 |  | The client tag in the Trino, team or environment tag |
| `Sessions[].Consumers[].TrinoSqlTable.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `Sessions[].Consumers[].TrinoSqlTable.Hostname` | `string` | &#10004 |  | The hostname of the Trino |
| `Sessions[].Consumers[].TrinoSqlTable.Password` | `string` | &#10004 |  | The password to login to the Trino |
| `Sessions[].Consumers[].TrinoSqlTable.Schema` | `string` | &#10004 |  | The name of the schema that holds the table name in it |
| `Sessions[].Consumers[].TrinoSqlTable.TableName` | `string` | &#10004 |  | The table to insert data to |
| `Sessions[].Consumers[].TrinoSqlTable.Username` | `string` | &#10004 |  | The username to login to the Trino |
| `Sessions[].Consumers[].TrinoSqlTable.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Consumers[].TrinoSqlTable.FilterSecondsBeforeRunStartTime` | `integer or string` | &#10006 | 0 | If the ReadFromRunStartTime is enabled, this property specifies how far before the start of the read action to start reading messages in seconds |
| `Sessions[].Consumers[].TrinoSqlTable.InsertionTimeField` | `string or null` | &#10006 |  | The insertion time field name, in cases where the table can be updated this will be the update time field |
| `Sessions[].Consumers[].TrinoSqlTable.InsertionTimeTimeZoneOffsetSummerTime` | `integer or string` | &#10006 | 0 | The time zone hour difference in comparison to UTC at summer time (daylight saving time) of the insertion time field |
| `Sessions[].Consumers[].TrinoSqlTable.ReadFromRunStartTime` | `string or true/false` | &#10006 | False | Whether to only read messages that arrived to the database after the start of the read action (true) or read all messages regardless of arrival time (false) |
| `Sessions[].Consumers[].TrinoSqlTable.WhereStatement` | `string or null` | &#10006 |  | The where statement (without the where keyword) to add to the sql query to filter db query results, if no statement is given doesn't use where in the query |
| `Sessions[].Consumers[].TrinoSqlTable.ColumnsToIgnore` | `list or string` | &#10006 | [] | The columns to ignore in the sql query results, if no columns are given doesn't ignore any columns |
| `Sessions[].Consumers[].TrinoSqlTable.ColumnsToIgnore[]` | `string` | &#10006 |  |  |
