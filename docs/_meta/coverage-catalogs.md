# QaaS Plugin Catalog Coverage

Generated: 2026-05-22

## QaaS.Common.Assertions

| Class | YAML key | Summary | Source file |
|-------|----------|---------|-------------|
| ExpectedResultsAmountNotMatchException | ExpectedResultsAmountNotMatchException | *(no summary)* | ExpectedResultsAmountNotMatchException.cs |
| CsvHandler | CsvHandler | *(no summary)* | CsvHandler.cs |
| FieldValidatorFactory | FieldValidatorFactory | *(no summary)* | FieldValidatorFactory.cs |
| Base64ToHexFieldValidator | Base64ToHexFieldValidator | *(no summary)* | Base64ToHexFieldValidator.cs |
| ErrorRangeFieldValidator | ErrorRangeFieldValidator | *(no summary)* | ErrorRangeFieldValidator.cs |
| ExactOverrideValueFieldValidator | ExactOverrideValueFieldValidator | *(no summary)* | ExactOverrideValueFieldValidator.cs |
| ExactValueFieldValidator | ExactValueFieldValidator | *(no summary)* | ExactValueFieldValidator.cs |
| JsonConverterFactory | JsonConverterFactory | *(no summary)* | JsonConverterFactory.cs |
| JsonToJsonConverter | JsonToJsonConverter | *(no summary)* | JsonToJsonConverter.cs |
| ObjectToJsonConverter | ObjectToJsonConverter | *(no summary)* | ObjectToJsonConverter.cs |
| XmlToJsonConverter | XmlToJsonConverter | *(no summary)* | XmlToJsonConverter.cs |
| OutputContentByExpectedCsvResults | OutputContentByExpectedCsvResults | Checks that the configured output content matches the expect | OutputContentByExpectedCsvResults.cs |
| DelayByAverage | DelayByAverage | Checks for delay between an input source to an output source | DelayByAverage.cs |
| DelayByChunks | DelayByChunks | Checks for delay between an input source to an output source | DelayByChunks.cs |
| EmptyInputListException | EmptyInputListException | Exception raised when a list of input injected to a componen | EmptyInputListException.cs |
| NegativeDelayException | NegativeDelayException | Negative delay received after subtracting output timestamp b | NegativeDelayException.cs |
| OutputDeserializableTo | OutputDeserializableTo | Performs a logic test that checks if the items of a configur | OutputDeserializableTo.cs |
| HermeticByExpectedOutputCount | HermeticByExpectedOutputCount | Performs a hermetic test by comparing the count of a given o | HermeticByExpectedOutputCount.cs |
| HermeticByExpectedOutputCountInRange | HermeticByExpectedOutputCountInRange | Performs a hermetic test by comparing the count of a given o | HermeticByExpectedOutputCountInRange.cs |
| HermeticByInputOutputPercentage | HermeticByInputOutputPercentage | Performs a hermetic test by comparing the the count of a spe | HermeticByInputOutputPercentage.cs |
| HermeticByInputOutputPercentageInRange | HermeticByInputOutputPercentageInRange | Checks whether the percentage between configured inputs and  | HermeticByInputOutputPercentageInRange.cs |
| HttpStatus | HttpStatus | Performs a logic test on the http status of all selected out | HttpStatus.cs |
| ObjectOutputJsonSchema | ObjectOutputJsonSchema | Validates that each configured output item matches at least  | ObjectOutputJsonSchema.cs |

## QaaS.Common.Generators

| Class | YAML key | Summary | Source file |
|-------|----------|---------|-------------|
| SerializedLoadedData | SerializedLoadedData | A structure representing a single loaded serialized data ite | SerializedLoadedData.cs |
| FromDataLake | FromDataLake | Retrieves rows from the configured data lake query and expos | FromDataLake.cs |
| FromDataSources | FromDataSources | Generates data from the enumerable of data sources it receiv | FromDataSources.cs |
| FromLettuceDataSources | FromLettuceDataSources | Generates data from the enumerable of data sources it receiv | FromLettuceDataSources.cs |
| FromSessionDataDataSources | FromSessionDataDataSources | Generates data from the enumerable of data sources it receiv | FromSessionDataDataSources.cs |
| Stacking | Stacking | Combines multiple data sources by taking a configured number | Stacking.cs |
| FromCSV | FromCSV | Reads CSV files from the configured file-system path and tur | FromCSV.cs |
| FromFileSystem | FromFileSystem | Retrieves data from files under a configured path in the loc | FromFileSystem.cs |
| FromS3 | FromS3 | Retrieves data from objects in a configured S3 bucket and pr | FromS3.cs |
| LettuceFromFileSystem | LettuceFromFileSystem | Retrieves lettuce-formatted files from the configured file-s | LettuceFromFileSystem.cs |
| Json | Json | Generates JSON data from a configured prototype document. | Json.cs |
| JsonNodeFieldInjector | JsonNodeFieldInjector | Injects fields into a JSON node. | JsonNodeFieldInjector.cs |
| PrototypeJsonNodeGenerator | PrototypeJsonNode | Represents a generator that creates JsonNode objects by clon | PrototypeJsonNodeGenerator.cs |
| SchemaDraft4JsonNodeGenerator | SchemaDraft4JsonNode | Represents a generator that creates JsonNode objects based a | SchemaDraft4JsonNodeGenerator.cs |
| JsonParserFactory | JsonParserFactory | This class is responsible for creating and managing instance | JsonParserFactory.cs |
| JsonParserToBinary | JsonParserToBinary | *(no summary)* | JsonParserToBinary.cs |
| JsonParserToProtobufMessage | JsonParserToProtobufMessage | *(no summary)* | JsonParserToProtobufMessage.cs |
| JsonParserToXml | JsonParserToXml | *(no summary)* | JsonParserToXml.cs |
| JsonSchemaDraft4 | JsonSchemaDraft4 | Generates JSON data that conforms to a configured JSON Schem | JsonSchemaDraft4.cs |
| BooleanJsonValueGenerator | BooleanJsonValue | *(no summary)* | BooleanJsonValueGenerator.cs |
| IntegerJsonValueGenerator | IntegerJsonValue | *(no summary)* | IntegerJsonValueGenerator.cs |
| JsonValueGeneratorFactory | JsonValueFactory | This class is a factory for generating JsonValueGenerator ob | JsonValueGeneratorFactory.cs |
| NullJsonValueGenerator | NullJsonValue | *(no summary)* | NullJsonValueGenerator.cs |
| NumberJsonValueGenerator | NumberJsonValue | *(no summary)* | NumberJsonValueGenerator.cs |
| StringJsonValueGenerator | StringJsonValue | *(no summary)* | StringJsonValueGenerator.cs |

## QaaS.Common.Probes

| Class | YAML key | Summary | Source file |
|-------|----------|---------|-------------|
| DeleteElasticIndices | DeleteElasticIndices | Deletes every Elasticsearch index that matches the configure | DeleteElasticIndices.cs |
| EmptyElasticIndices | EmptyElasticIndices | Empties elastic indices by their index pattern | EmptyElasticIndices.cs |
| DropMongoDbCollection | DropMongoDbCollection | Drops the configured MongoDB collection so a later run can r | DropMongoDbCollection.cs |
| EmptyMongoDbCollection | EmptyMongoDbCollection | Deletes all documents from the configured MongoDB collection | EmptyMongoDbCollection.cs |
| OsChangeDeploymentEnvVars | OsChangeDeploymentEnvVars | Probe that changes the environment variables of a deployment | OsChangeDeploymentEnvVars.cs |
| OsChangeStatefulSetEnvVars | OsChangeStatefulSetEnvVars | Probe that changes the environment variables of a statefulSe | OsChangeStatefulSetEnvVars.cs |
| OsEditYamlConfigMap | OsEditYamlConfigMap | Probe that edits yaml config maps | OsEditYamlConfigMap.cs |
| OsExecuteCommandsInContainers | OsExecuteCommandsInContainers | Probe that Executes a command passed by the `cmd` string var | OsExecuteCommandsInContainers.cs |
| OsRestartPods | OsRestartPods | Probe that restarts all pods with configured labels in the c | OsRestartPods.cs |
| OsScaleDeploymentPods | OsScaleDeploymentPods | Probe that scales openshift deployments | OsScaleDeploymentPods.cs |
| OsScaleStatefulSetPods | OsScaleStatefulSetPods | Probe that scales openshift statefulsets | OsScaleStatefulSetPods.cs |
| OsUpdateDeploymentImage | OsUpdateDeploymentImage | Updates the image of one container in a Kubernetes or OpenSh | OsUpdateDeploymentImage.cs |
| OsUpdateDeploymentResources | OsUpdateDeploymentResources | Updates container resource requests and limits in a Kubernet | OsUpdateDeploymentResources.cs |
| OsUpdateStatefulSetImage | OsUpdateStatefulSetImage | Updates the image of one container in a Kubernetes or OpenSh | OsUpdateStatefulSetImage.cs |
| OsUpdateStatefulSetResources | OsUpdateStatefulSetResources | Updates container resource requests and limits in a Kubernet | OsUpdateStatefulSetResources.cs |
| CreateRabbitMqBindings | CreateRabbitMqBindings | Creates RabbitMQ bindings between exchanges and queues or be | CreateRabbitMqBindings.cs |
| CreateRabbitMqExchanges | CreateRabbitMqExchanges | Creates one or more RabbitMQ exchanges with the configured d | CreateRabbitMqExchanges.cs |
| CreateRabbitMqQueues | CreateRabbitMqQueues | Creates one or more RabbitMQ queues with the configured queu | CreateRabbitMqQueues.cs |
| CreateRabbitMqUsers | CreateRabbitMqUsers | Creates RabbitMQ users through the management API with the c | CreateRabbitMqUsers.cs |
| CreateRabbitMqVirtualHosts | CreateRabbitMqVirtualHosts | Creates RabbitMQ virtual hosts through the management API so | CreateRabbitMqVirtualHosts.cs |
| DeleteRabbitMqBindings | DeleteRabbitMqBindings | Deletes RabbitMQ bindings using the configured source, desti | DeleteRabbitMqBindings.cs |
| DeleteRabbitMqExchanges | DeleteRabbitMqExchanges | Probe that deletes rabbitmq exchanges | DeleteRabbitMqExchanges.cs |
| DeleteRabbitMqPermissions | DeleteRabbitMqPermissions | Deletes RabbitMQ user permissions in one or more virtual hos | DeleteRabbitMqPermissions.cs |
| DeleteRabbitMqQueues | DeleteRabbitMqQueues | Probe that deletes rabbitmq queues | DeleteRabbitMqQueues.cs |
| DeleteRabbitMqUsers | DeleteRabbitMqUsers | Deletes RabbitMQ users through the management API. | DeleteRabbitMqUsers.cs |
| DeleteRabbitMqVirtualHosts | DeleteRabbitMqVirtualHosts | Deletes RabbitMQ virtual hosts through the management API. | DeleteRabbitMqVirtualHosts.cs |
| DownloadRabbitMqDefinitions | DownloadRabbitMqDefinitions | Downloads RabbitMQ definitions from the management API so th | DownloadRabbitMqDefinitions.cs |
| PurgeRabbitMqQueues | PurgeRabbitMqQueues | Probe that purges rabbitmq queues | PurgeRabbitMqQueues.cs |
| UploadRabbitMqDefinitions | UploadRabbitMqDefinitions | Uploads a previously captured RabbitMQ definitions file back | UploadRabbitMqDefinitions.cs |
| UpsertRabbitMqPermissions | UpsertRabbitMqPermissions | Creates or updates RabbitMQ permissions for users in one or  | UpsertRabbitMqPermissions.cs |
| EmptyRedisByChunks | EmptyRedisByChunks | Scans the selected Redis database in batches and deletes mat | EmptyRedisByChunks.cs |
| ExecuteRedisCommand | ExecuteRedisCommand | Executes one Redis command with optional arguments against t | ExecuteRedisCommand.cs |
| ExecuteRedisCommands | ExecuteRedisCommands | Executes multiple Redis commands sequentially against the se | ExecuteRedisCommands.cs |
| FlushAllRedis | FlushAllRedis | Runs Redis FLUSHALL against the configured server to remove  | FlushAllRedis.cs |
| FlushDbRedis | FlushDbRedis | Runs Redis FLUSHDB against the selected Redis database. | FlushDbRedis.cs |
| CreateS3Bucket | CreateS3Bucket | Ensures the configured S3 bucket exists by creating it when  | CreateS3Bucket.cs |
| DeleteS3Bucket | DeleteS3Bucket | Empties the configured S3 bucket and deletes it, treating a  | DeleteS3Bucket.cs |
| EmptyS3Bucket | EmptyS3Bucket | Deletes objects from the configured S3 bucket, optionally co | EmptyS3Bucket.cs |
| MsSqlDataBaseTablesTruncate | MsSqlDataBaseTablesTruncate | Truncates the configured Microsoft SQL Server tables in the  | MsSqlDataBaseTablesTruncate.cs |
| OracleSqlDataBaseTablesTruncate | OracleSqlDataBaseTablesTruncate | Truncates the configured Oracle tables in the order they are | OracleSqlDataBaseTablesTruncate.cs |
| PostgreSqlDataBaseTablesTruncate | PostgreSqlDataBaseTablesTruncate | Truncates the configured PostgreSQL tables in the order they | PostgreSqlDataBaseTablesTruncate.cs |

## QaaS.Common.Processors

| Class | YAML key | Summary | Source file |
|-------|----------|---------|-------------|
| ConditionalResponseProcessor | ConditionalResponse | Returns the first configured response whose rule matches the | ConditionalResponseProcessor.cs |
| DataSourceResponseProcessor | DataSourceResponse | Builds the response from generated data produced by one conf | DataSourceResponseProcessor.cs |
| JsonEnvelopeProcessor | JsonEnvelope | Wraps the incoming request payload and optional request meta | JsonEnvelopeProcessor.cs |
| PassThroughProcessor | PassThrough | Returns the incoming request payload unchanged while applyin | PassThroughProcessor.cs |
| ProblemDetailsProcessor | ProblemDetails | Returns an RFC 7807 style problem-details JSON response usin | ProblemDetailsProcessor.cs |
| RequestEchoProcessor | RequestEcho | Returns a JSON response that echoes the incoming request bod | RequestEchoProcessor.cs |
| StaticResponseProcessor | StaticResponse | Returns a fixed UTF-8 response body with the configured stat | StaticResponseProcessor.cs |
| StatusCodeTransactionProcessor | StatusCodeTransaction | Skim Transaction Processor which returns empty-bodied data o | StatusCodeTransactionProcessor.cs |
| TextTransformProcessor | TextTransform | Reads the incoming payload as text, applies the configured t | TextTransformProcessor.cs |

## Summary & Metrics

| Repo | Prod Classes | Missing XMLDoc | Schema Claim |
|------|--------------|----------------|---------------|
| QaaS.Common.Assertions | 23 | 11 | 11 |
| QaaS.Common.Generators | 25 | 8 | 11 |
| QaaS.Common.Probes | 41 | 0 | 41 |
| QaaS.Common.Processors | 9 | 0 | 9 |

## Auto-gen Feasibility

QaaS.Docs.Generator is rated 7/10 extensible per prior agent; needs per-plugin overview + config tables (10-14h work).
