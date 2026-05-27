# Publishers Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions[].Publishers` | `list or string or null` | &#10006 |  | List of all publishers to build and run for this session. Publishers iterate over data and use protocols to send it to the application |
| `Sessions[].Publishers[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Name` | `string` | &#10004 |  | The name of the publisher |
| `Sessions[].Publishers[].Configuration` | `object or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Iterations` | `integer or string` | &#10006 | 1 | How much iterations of the publishing action to execute |
| `Sessions[].Publishers[].Loop` | `string or true/false` | &#10006 | False | Whether to publish in loop |
| `Sessions[].Publishers[].SleepTimeMs` | `integer or string` | &#10006 | 0 | The time to sleep in milliseconds in between iterations |
| `Sessions[].Publishers[].Stage` | `integer or string` | &#10006 | 1 | The stage in which the Publisher runs at |
| `Sessions[].Publishers[].DataSourceNames` | `list or string or null` | &#10006 |  | The name of the data sources to publish the data of in the order their data will be published |
| `Sessions[].Publishers[].DataSourceNames[]` | `string` | &#10006 |  |  |
| `Sessions[].Publishers[].DataSourcePatterns` | `list or string or null` | &#10006 |  | Patterns of the names of data sources to publish the data of off |
| `Sessions[].Publishers[].DataSourcePatterns[]` | `string` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies` | `list or string` | &#10006 |  | List of policies to use when communicating with this action's protocol |
| `Sessions[].Publishers[].Policies[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance` | `object or string` | &#10006 |  | This policy executes actions in separate stages, each stage has a rate in which to execute the actions included in it and a count or timeout to know after how many actions or after how much time to end the stage and move to the next. |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages` | `list or string or null` | &#10006 |  | The stages of publishing information, in each stage the messages will be publishedwith a given rate untill 'Amount' messages are generated or untill 'TimeoutMs' is reached |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].Rate` | `number or string` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].Amount` | `integer or string or null` | &#10006 |  | The number of times to perform action |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Publishers[].Policies[].AdvancedLoadBalance.Stages[].TimeoutMs` | `integer or string or null` | &#10006 |  | The time in milliseconds before stopping the communication action |
| `Sessions[].Publishers[].Policies[].Count` | `object or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].Count.Count` | `integer or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance` | `object or string` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed and increasing it overtime |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.MaxRate` | `integer or string` | &#10004 |  | The maximum amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.StartRate` | `integer or string` | &#10004 |  | The initial amount of actions to perform every TimeIntervalMs milliseconds |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.RateIncrease` | `integer or string or null` | &#10006 | 1 | How much to increase the rate every RateIncreaseIntervalMs |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.RateIncreaseIntervalMs` | `number or string` | &#10006 | 1000 | How often to increase the rate by RateIncrease in milliseconds |
| `Sessions[].Publishers[].Policies[].IncreasingLoadBalance.TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Publishers[].Policies[].LoadBalance` | `object or string` | &#10006 |  | This policy is in charge of controlling the rate in which the action is repeatedly executed |
| `Sessions[].Publishers[].Policies[].LoadBalance.Rate` | `number or string` | &#10004 |  | The amount of actions to perform every `TimeIntervalMs` milliseconds |
| `Sessions[].Publishers[].Policies[].LoadBalance.TimeIntervalMs` | `integer or string` | &#10006 | 1000 | The time in milliseconds to perform `Rate` actions in |
| `Sessions[].Publishers[].Policies[].Timeout` | `object or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Policies[].Timeout.TimeoutMs` | `integer or string` | &#10006 |  |  |
| `Sessions[].Publishers[].Chunk` | `object or string` | &#10006 |  | Determines whether the publisher acts as a chunk publisher |
| `Sessions[].Publishers[].Chunk.ChunkSize` | `integer or string` | &#10004 |  | The size of the chunk to use |
| `Sessions[].Publishers[].DataFilter` | `object or string` | &#10006 |  | How to filter the properties of each returned published data |
| `Sessions[].Publishers[].DataFilter.Body` | `string or true/false` | &#10006 | True | Whether to keep the `Body` in the data (true) or filter it (false) |
| `Sessions[].Publishers[].DataFilter.MetaData` | `string or true/false` | &#10006 | True | Whether to keep the `MetaData` in the data (true) or filter it (false) |
| `Sessions[].Publishers[].DataFilter.Timestamp` | `string or true/false` | &#10006 | True | Whether to keep the `Timestamp` in the data (true) or filter it (false) |
| `Sessions[].Publishers[].ElasticIndex` | `object or string` | &#10006 |  | Publishes documents to an elastic index |
| `Sessions[].Publishers[].ElasticIndex.IndexName` | `string` | &#10004 |  | Name of the index to publish documents to. if the index doesn't exist, it will create the index |
| `Sessions[].Publishers[].ElasticIndex.Password` | `string` | &#10004 |  | The password of the elasticsearch |
| `Sessions[].Publishers[].ElasticIndex.Url` | `string` | &#10004 |  | The url of the elasticsearch |
| `Sessions[].Publishers[].ElasticIndex.Username` | `string` | &#10004 |  | The username of the elasticsearch |
| `Sessions[].Publishers[].ElasticIndex.BatchSize` | `integer or string or null` | &#10006 |  | Batch size of publishing actions to the elastic index, when configured to null all generation data is considered as one batch |
| `Sessions[].Publishers[].ElasticIndex.PublishAsync` | `string or true/false` | &#10006 | False | Whether to publish to elastic asynchronously (faster but dosen't publish by the given order) |
| `Sessions[].Publishers[].ElasticIndex.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |
| `Sessions[].Publishers[].KafkaTopic` | `object or string` | &#10006 |  | Publishes messages to a kafka topic |
| `Sessions[].Publishers[].KafkaTopic.Password` | `string` | &#10004 |  | Kafka Service with read permissions for the topic's password |
| `Sessions[].Publishers[].KafkaTopic.TopicName` | `string` | &#10004 |  | Name of the topic to read messages from |
| `Sessions[].Publishers[].KafkaTopic.Username` | `string` | &#10004 |  | Kafka Service with read permissions for the topic's username |
| `Sessions[].Publishers[].KafkaTopic.CompressionLevel` | `integer or string` | &#10006 |  | Compression level for selected CompressionType algorithm, higher values will result in better compression at the cost of more CPU usage. |
| `Sessions[].Publishers[].KafkaTopic.CompressionType` | `one of [None / Gzip / Snappy / Lz4 / Zstd]` | &#10006 |  | Compression type to use before sending messages |
| `Sessions[].Publishers[].KafkaTopic.DefaultKafkaKey` | `string or null` | &#10006 |  | The default kafka message key given if no key is given in the generated data under `MetaData` in the kafka key field |
| `Sessions[].Publishers[].KafkaTopic.Headers` | `object or string or null` | &#10006 |  | Default Headers to send messages with, if the message doesn't contain any Headers in its MetaData these Headers are used |
| `Sessions[].Publishers[].KafkaTopic.MessageMaxBytes` | `integer or string` | &#10006 | 1000000 | Maximum allowed Kafka message size in bytes. Must not exceed broker/topic limits. |
| `Sessions[].Publishers[].KafkaTopic.MessageSendMaxRetries` | `integer or string` | &#10006 | 10 | Max amount of retries when message send to Kafka Topic failed. |
| `Sessions[].Publishers[].KafkaTopic.MessageSendRetriesIntervalMs` | `integer or string` | &#10006 | 1000 | Time interval in milliseconds to wait between each retry of Kafka Topic message send. |
| `Sessions[].Publishers[].KafkaTopic.Partition` | `integer or string` | &#10006 | -1 | The Kafka partition to produce to, by default -1 is treated as Partition.Any which will mean it uses an unspecified / unknown partition. |
| `Sessions[].Publishers[].KafkaTopic.QueueBufferingBackpressureThreshold` | `integer or string` | &#10006 | 1 | The threshold of outstanding not yet transmitted broker requests needed to backpressure the producer's message accumulator. |
| `Sessions[].Publishers[].KafkaTopic.QueueBufferingMaxKbytes` | `integer or string` | &#10006 | 1048576 | Maximum total message size sum allowed on the inner producer queue. |
| `Sessions[].Publishers[].KafkaTopic.QueueBufferingMaxMessages` | `integer or string` | &#10006 | 100000 | Maximum number of messages allowed on the inner producer queue. A value of 0 disables this limit. |
| `Sessions[].Publishers[].KafkaTopic.SaslMechanism` | `one of [Gssapi / Plain / ScramSha256 / ScramSha512 / OAuthBearer]` | &#10006 |  | The Sasl mechanism used in the kafka |
| `Sessions[].Publishers[].KafkaTopic.SecurityProtocol` | `one of [Plaintext / Ssl / SaslPlaintext / SaslSsl]` | &#10006 |  | The Sasl's security protocol |
| `Sessions[].Publishers[].KafkaTopic.HostNames` | `list or string` | &#10004 |  | List of the kafka hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `Sessions[].Publishers[].KafkaTopic.HostNames[]` | `string` | &#10006 |  |  |
| `Sessions[].Publishers[].MongoDbCollection` | `object or string` | &#10006 |  | Publishes messages to an MongoDb collection |
| `Sessions[].Publishers[].MongoDbCollection.CollectionName` | `string` | &#10004 |  | The collection to insert data to |
| `Sessions[].Publishers[].MongoDbCollection.ConnectionString` | `string` | &#10004 |  | The connection string to the MongoDb server |
| `Sessions[].Publishers[].MongoDbCollection.DatabaseName` | `string` | &#10004 |  | The DB to insert data to |
| `Sessions[].Publishers[].MsSqlTable` | `object or string` | &#10006 |  | Publishes messages to an mssql database table |
| `Sessions[].Publishers[].MsSqlTable.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `Sessions[].Publishers[].MsSqlTable.TableName` | `string` | &#10004 |  | The table to insert data to |
| `Sessions[].Publishers[].MsSqlTable.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Publishers[].MsSqlTable.IsUDTInsertion` | `string or true/false` | &#10006 | False | Determines whether User-Defined Type (UDT) insertion is required. If UDT insertion is not necessary, it is recommended to set this property to false. UDT insertion can slow down data insertion, especially for large datasets. Therefore, it is recommended to only use UDT insertion when necessary. |
| `Sessions[].Publishers[].OracleSqlTable` | `object or string` | &#10006 |  | Publishes messages to an oracle sql database table |
| `Sessions[].Publishers[].OracleSqlTable.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `Sessions[].Publishers[].OracleSqlTable.TableName` | `string` | &#10004 |  | The table to insert data to |
| `Sessions[].Publishers[].OracleSqlTable.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Publishers[].Parallel` | `object or string` | &#10006 |  | Whether to publish in a specified parallelism |
| `Sessions[].Publishers[].Parallel.Parallelism` | `integer or string` | &#10004 |  | The amount of parallel tasks to execute at once |
| `Sessions[].Publishers[].PostgreSqlTable` | `object or string` | &#10006 |  | Publishes messages to a postgresql database table |
| `Sessions[].Publishers[].PostgreSqlTable.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `Sessions[].Publishers[].PostgreSqlTable.TableName` | `string` | &#10004 |  | The table to insert data to |
| `Sessions[].Publishers[].PostgreSqlTable.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute an sql copy/insertion command and generating an error |
| `Sessions[].Publishers[].RabbitMq` | `object or string` | &#10006 |  | Publishes messages to a rabbitmq |
| `Sessions[].Publishers[].RabbitMq.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `Sessions[].Publishers[].RabbitMq.ContentType` | `string or null` | &#10006 |  | Default ContentType to send messages with, if the message doesn't contain ContentType in its MetaData this one is Used |
| `Sessions[].Publishers[].RabbitMq.ContinuationTimeoutSeconds` | `integer or string` | &#10006 | 5 | Amount of time protocol operations (e.g. queue.declare) are allowed to take before timing out in seconds |
| `Sessions[].Publishers[].RabbitMq.ExchangeName` | `string or null` | &#10006 |  | Name of the exchange to send messages toCannot be set if configured QueueName to read from. |
| `Sessions[].Publishers[].RabbitMq.Expiration` | `string or null` | &#10006 |  | Default Message expiration duration to send messages with, if the message doesn't contain any Expiration in its MetaData this Expiration is used |
| `Sessions[].Publishers[].RabbitMq.HandshakeContinuationTimeoutSeconds` | `integer or string` | &#10006 | 10 | Amount of time protocol handshake operations are allowed to take before timing out in seconds |
| `Sessions[].Publishers[].RabbitMq.Headers` | `object or string or null` | &#10006 |  | Default Headers to send messages with, if the message doesn't contain any Headers in its MetaData these Headers are used |
| `Sessions[].Publishers[].RabbitMq.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `Sessions[].Publishers[].RabbitMq.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `Sessions[].Publishers[].RabbitMq.QueueName` | `string or null` | &#10006 |  | Name of the queue to send messages to. Cannot be set if configured ExchangeName to read from. |
| `Sessions[].Publishers[].RabbitMq.RequestedConnectionTimeoutSeconds` | `integer or string` | &#10006 | 5 | Timeout setting for connection attempts in seconds |
| `Sessions[].Publishers[].RabbitMq.RoutingKey` | `string` | &#10006 | / | Default routing key to send mesages to the exchange with, if the message doesn't contain any RoutingKey in its MetaData this routing key is used |
| `Sessions[].Publishers[].RabbitMq.Type` | `string or null` | &#10006 |  | Default Type to send messages with, if the message doesn't contain Type in its MetaData this one is Used |
| `Sessions[].Publishers[].RabbitMq.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `Sessions[].Publishers[].RabbitMq.VirtualHost` | `string` | &#10006 | / | Rabbitmq virual host to access during this connection |
| `Sessions[].Publishers[].Redis` | `object or string` | &#10006 |  | Publishes messages to a redis cache |
| `Sessions[].Publishers[].Redis.RedisDataType` | `one of [SetString / ListLeftPush / ListRightPush / SetAdd / HashSet / SortedSetAdd / GeoAdd]` | &#10004 |  | Redis data type to use, define the function the qaas will use to send to the redis server |
| `Sessions[].Publishers[].Redis.AbortOnConnectFail` | `string or true/false` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `Sessions[].Publishers[].Redis.AsyncTimeout` | `integer or string` | &#10006 | 5000 | Time(ms) to allow for asynchronous operations |
| `Sessions[].Publishers[].Redis.BatchSize` | `integer or string or null` | &#10006 |  | Batch size of sending actions to the redis, when configured to null all generation data is considred as one batch |
| `Sessions[].Publishers[].Redis.ClientName` | `string or null` | &#10006 |  | Identification for the connection within redis |
| `Sessions[].Publishers[].Redis.CommandFlags` | `one of [None / PreferMaster / HighPriority / FireAndForget / DemandMaster / PreferSlave / PreferReplica / DemandSlave / DemandReplica / NoRedirect / NoScriptCache]` | &#10006 |  | Specifies the command flags that should be performed, behaviour markers associated with a given command |
| `Sessions[].Publishers[].Redis.ConnectRetry` | `integer or string` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `Sessions[].Publishers[].Redis.KeepAlive` | `integer or string` | &#10006 | 60 | Time (seconds) at which to send a message to help keep alive |
| `Sessions[].Publishers[].Redis.Password` | `string or null` | &#10006 |  | Password for the redis server |
| `Sessions[].Publishers[].Redis.RedisDataBase` | `integer or string` | &#10006 | 0 | Redis database to use |
| `Sessions[].Publishers[].Redis.Retries` | `integer or string` | &#10006 | 1 | How many times to retry when failing to send an item, before crash |
| `Sessions[].Publishers[].Redis.RetryIntervalMs` | `integer or string` | &#10006 | 1000 | Retries interval milliseconds |
| `Sessions[].Publishers[].Redis.Ssl` | `string or true/false` | &#10006 | False | Specifies that SSL encryption should be used |
| `Sessions[].Publishers[].Redis.SslHost` | `string or null` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `Sessions[].Publishers[].Redis.Username` | `string or null` | &#10006 |  | User for the redis server |
| `Sessions[].Publishers[].Redis.When` | `one of [Always / Exists / NotExists]` | &#10006 |  | Indicates when this operation should be performed (only some variations are legal in a given context) |
| `Sessions[].Publishers[].Redis.HostNames` | `list or string` | &#10004 |  | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `Sessions[].Publishers[].Redis.HostNames[]` | `string` | &#10006 |  |  |
| `Sessions[].Publishers[].S3Bucket` | `object or string` | &#10006 |  | Publishes messages to an S3 bucket |
| `Sessions[].Publishers[].S3Bucket.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `Sessions[].Publishers[].S3Bucket.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `Sessions[].Publishers[].S3Bucket.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `Sessions[].Publishers[].S3Bucket.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `Sessions[].Publishers[].S3Bucket.ForcePathStyle` | `string or true/false` | &#10006 | True | When true, requests will always use path style addressing |
| `Sessions[].Publishers[].S3Bucket.Prefix` | `string` | &#10006 |  | The object's naming prefix |
| `Sessions[].Publishers[].S3Bucket.Retries` | `integer or string or null` | &#10006 |  | The number of times to retry sending to S3 in case the s3 maximum IO is reached |
| `Sessions[].Publishers[].S3Bucket.S3SentObjectsNaming` | `one of [GrowingNumericalSeries / RandomGuid]` | &#10006 |  | The naming type of the object naming generator |
| `Sessions[].Publishers[].S3Bucket.S3StorageClass` | `one of [DeepArchive / Glacier / GlacierInstantRetrieval / IntelligentTiering / OneZoneInfrequentAccess / Outposts / ReducedRedundancy / Standard / StandardInfrequentAccess]` | &#10006 |  | S3 Storage Class Definitions. Options:[`Glacier` - The GLACIER storage is for object that are stored in Amazon Glacier. This storage class is for objects that are for archival purpose and get operations are rare.  Durability 99.999999999 / `Outposts` - The OUTPOSTS storage class for objects stored in a S3 Outpost / `Standard` - The STANDARD storage class, which is the default storage class for S3.  Durability 99.999999999%; Availability 99.99% over a given year/ `DeepArchive` - S3 Glacier Deep Archive provides secure, durable object storage class for long term data archival. It is the ideal storage class to make an archival, durable copy of data that rarely, if ever, needs to be accessed. It can be used as an offline backup for their most important data assets and to meet long-term retention needs. / `IntelligentTiering - IntelligentTiering makes it easy to lower your overall cost of storage by automatically placing data in the storage class that best matches the access patterns for the storage. With IntelligentTiering, you don’t need to define and manage individual policies for lifecycle data management or write code to transition objects between storage classes. Instead, you can use IntelligentTiering to manage transitions between Standard and S-IA without writing any application code. IntelligentTiering also manages transitions automatically to Glacier for long term archive in addition to S3 storage classes.` / `ReducedRedundancy` - REDUCED_REDUNDANCY provides the same availability as standard, but at a lower durability.  Durability 99.99%; Availability 99.99% over a given year. / `GlacierInstantRetrieval` - Constant GLACIER_IR for ObjectStorageClass / `StandardInfrequentAccess` - The STANDARD_IA storage is for infrequently accessed objects. This storage class is for objects that are long-lived and less frequently accessed, like backups and older data.  Durability 99.999999999%; Availability 99.9% over a given year. / `OneZoneInfrequentAccess` - The ONEZONE_IA storage is for infrequently accessed objects. It is similiar to STANDARD_IA, but only stores object data within one Availablity Zone in a given region.  Durability 99.999999999%; Availability 99% over a given year.] |
| `Sessions[].Publishers[].Serialize` | `object or string` | &#10006 |  | The serializer to use to serialize the data to publish |
| `Sessions[].Publishers[].Serialize.Serializer` | `one of [Binary / Json / MessagePack / Xml / Yaml / ProtobufMessage / XmlElement]` | &#10006 |  | The serializer type to use for serializing. Null means no serialization will happen. Options are all available `QaaS.Framework.Serialization` serializers |
| `Sessions[].Publishers[].Sftp` | `object or string` | &#10006 |  | Publishes files to a remote machine using SFTP |
| `Sessions[].Publishers[].Sftp.Hostname` | `string` | &#10004 |  | The hostname of the remote machine |
| `Sessions[].Publishers[].Sftp.Password` | `string` | &#10004 |  | The password for accessing the remote machine |
| `Sessions[].Publishers[].Sftp.Path` | `string` | &#10004 |  | The path of the relevant directory in the remote machine |
| `Sessions[].Publishers[].Sftp.Username` | `string` | &#10004 |  | The username for accessing the remote machine |
| `Sessions[].Publishers[].Sftp.NamingType` | `one of [GrowingNumericalSeries / RandomGuid]` | &#10006 |  | The naming type of the object naming generator |
| `Sessions[].Publishers[].Sftp.Port` | `integer or string` | &#10006 | 22 | The port in the remote machine |
| `Sessions[].Publishers[].Sftp.Prefix` | `string` | &#10006 |  | The object's naming prefix |
| `Sessions[].Publishers[].Socket` | `object or string` | &#10006 |  | Publishes messages from a socket to an endpoint |
| `Sessions[].Publishers[].Socket.Host` | `string` | &#10004 |  | Socket connection endpoint hostname |
| `Sessions[].Publishers[].Socket.Port` | `integer or string` | &#10004 |  | Socket connection endpoint port |
| `Sessions[].Publishers[].Socket.ProtocolType` | `one of [IP / IPv6HopByHopOptions / Unspecified / Icmp / Igmp / Ggp / IPv4 / Tcp / Pup / Udp / Idp / IPv6 / IPv6RoutingHeader / IPv6FragmentHeader / IPSecEncapsulatingSecurityPayload / IPSecAuthenticationHeader / IcmpV6 / IPv6NoNextHeader / IPv6DestinationOptions / ND / Raw / Ipx / Spx / SpxII / Unknown]` | &#10004 |  | Specifies the protocol to use in the socket |
| `Sessions[].Publishers[].Socket.AddressFamily` | `one of [Unspecified / Unix / InterNetwork / ImpLink / Pup / Chaos / NS / Ipx / Iso / Osi / Ecma / DataKit / Ccitt / Sna / DecNet / DataLink / Lat / HyperChannel / AppleTalk / NetBios / VoiceView / FireFox / Banyan / Atm / InterNetworkV6 / Cluster / Ieee12844 / Irda / NetworkDesigners / Max / Packet / ControllerAreaNetwork / Unknown]` | &#10006 |  | Specifies the addressing scheme to use in the socket |
| `Sessions[].Publishers[].Socket.BufferSize` | `integer or string` | &#10006 | 65536 | The size of the send buffer, in bytes. Increasing it can improve sending speed substantially but will use more memory.To achieve max speed the buffer needs to be the size of all sent data combined |
| `Sessions[].Publishers[].Socket.LingerTimeSeconds` | `integer or string or null` | &#10006 |  | the number of seconds to remain connected after sending all the data, null means it does not remain connected after sending the data. |
| `Sessions[].Publishers[].Socket.NagleAlgorithm` | `string or true/false` | &#10006 | False | Whether to use the Nagle Algorithm (true) or not(false). The Nagle algorithm is a method used in TCP/IP networks to improve the efficiency of data transmission. It's designed to reduce the number of small packets that are sent over the network.The Nagle algorithm is designed to improve the efficiency of small packets, but it can sometimes cause delays in the transmission of large packets. |
| `Sessions[].Publishers[].Socket.SendTimeoutMs` | `integer or string` | &#10006 | 5000 | socket's timeout sending a packet in milliseconds |
| `Sessions[].Publishers[].Socket.SocketType` | `one of [Stream / Dgram / Raw / Rdm / Seqpacket / Unknown]` | &#10006 |  | Specifies the type of socket |
