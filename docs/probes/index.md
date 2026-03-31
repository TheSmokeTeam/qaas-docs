# Probes

Probes are **hooks** that manipulate infrastructure before or after [Sessions](../qaas/userInterfaces/runner/configurationSections/sessions/overview.md) run. They are typically used for setup and cleanup tasks such as creating queues, flushing caches, scaling pods, truncating tables, or deleting data.

The **QaaS.Common.Probes** NuGet package ships the built-in probe library. You can author custom probes by implementing `BaseProbe<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                  |
|----------------|------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Probes`                                             |
| **Source**     | [QaaS.Common.Probes]({{ links.repository_probes }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)               |

## Installation

```xml
<PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
```

## Writing Custom Probes

See [Write Hooks](../qaas/quickStart/writeHooks.md) for the pattern.


<!-- generated hook catalog start -->
## Available Hooks

The built-in hooks below are grouped by usage area so it is easier to shortlist the right hook before drilling into configuration details.

### RabbitMQ administration

- [CreateRabbitMqBindings](availableProbes/CreateRabbitMqBindings/overview.md): Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions.
- [DeleteRabbitMqBindings](availableProbes/DeleteRabbitMqBindings/overview.md): Deletes RabbitMQ bindings using the configured source, destination, routing key, and binding type.
- [DownloadRabbitMqDefinitions](availableProbes/DownloadRabbitMqDefinitions/overview.md): Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused.
- [UploadRabbitMqDefinitions](availableProbes/UploadRabbitMqDefinitions/overview.md): Uploads a previously captured RabbitMQ definitions file back into the broker through the management API.
- [CreateRabbitMqExchanges](availableProbes/CreateRabbitMqExchanges/overview.md): Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments.
- [DeleteRabbitMqExchanges](availableProbes/DeleteRabbitMqExchanges/overview.md): Probe that deletes rabbitmq exchanges
- [DeleteRabbitMqPermissions](availableProbes/DeleteRabbitMqPermissions/overview.md): Deletes RabbitMQ user permissions in one or more virtual hosts through the management API.
- [UpsertRabbitMqPermissions](availableProbes/UpsertRabbitMqPermissions/overview.md): Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API.
- [CreateRabbitMqQueues](availableProbes/CreateRabbitMqQueues/overview.md): Creates one or more RabbitMQ queues with the configured queue arguments.
- [DeleteRabbitMqQueues](availableProbes/DeleteRabbitMqQueues/overview.md): Probe that deletes rabbitmq queues
- [PurgeRabbitMqQueues](availableProbes/PurgeRabbitMqQueues/overview.md): Probe that purges rabbitmq queues
- [CreateRabbitMqUsers](availableProbes/CreateRabbitMqUsers/overview.md): Creates RabbitMQ users through the management API with the configured credentials and tags.
- [DeleteRabbitMqUsers](availableProbes/DeleteRabbitMqUsers/overview.md): Deletes RabbitMQ users through the management API.
- [CreateRabbitMqVirtualHosts](availableProbes/CreateRabbitMqVirtualHosts/overview.md): Creates RabbitMQ virtual hosts through the management API so later probes and sessions can use them.
- [DeleteRabbitMqVirtualHosts](availableProbes/DeleteRabbitMqVirtualHosts/overview.md): Deletes RabbitMQ virtual hosts through the management API.

### Redis maintenance

- [ExecuteRedisCommand](availableProbes/ExecuteRedisCommand/overview.md): Executes one Redis command with optional arguments against the selected Redis database, optionally storing the result for later redisResults placeholder reuse.
- [ExecuteRedisCommands](availableProbes/ExecuteRedisCommands/overview.md): Executes multiple Redis commands sequentially against the selected Redis database, allowing later commands to reuse earlier results through redisResults placeholders and optional looping.
- [EmptyRedisByChunks](availableProbes/EmptyRedisByChunks/overview.md): Concrete Redis chunk-deletion probe that uses the standard Redis batch probe configuration.
- [FlushAllRedis](availableProbes/FlushAllRedis/overview.md): Runs Redis FLUSHALL against the configured server to remove keys from every database.
- [FlushDbRedis](availableProbes/FlushDbRedis/overview.md): Runs Redis FLUSHDB against the selected Redis database.

### Databases

- [DeleteElasticIndices](availableProbes/DeleteElasticIndices/overview.md): Deletes every Elasticsearch index that matches the configured index pattern.
- [EmptyElasticIndices](availableProbes/EmptyElasticIndices/overview.md): Empties elastic indices by their index pattern
- [DropMongoDbCollection](availableProbes/DropMongoDbCollection/overview.md): Drops the configured MongoDB collection so a later run can recreate it from scratch.
- [EmptyMongoDbCollection](availableProbes/EmptyMongoDbCollection/overview.md): Deletes all documents from the configured MongoDB collection so it starts clean for the test run.
- [CreateS3Bucket](availableProbes/CreateS3Bucket/overview.md): Ensures the configured S3 bucket exists by creating it when it is missing.
- [DeleteS3Bucket](availableProbes/DeleteS3Bucket/overview.md): Probe to delete a s3 bucket
- [EmptyS3Bucket](availableProbes/EmptyS3Bucket/overview.md): Probe to empty a s3 bucket according to a certain prefix

### SQL maintenance

- [MsSqlDataBaseTablesTruncate](availableProbes/MsSqlDataBaseTablesTruncate/overview.md): Truncates the configured Microsoft SQL Server tables in the order they are listed.
- [OracleSqlDataBaseTablesTruncate](availableProbes/OracleSqlDataBaseTablesTruncate/overview.md): Truncates the configured Oracle tables in the order they are listed.
- [PostgreSqlDataBaseTablesTruncate](availableProbes/PostgreSqlDataBaseTablesTruncate/overview.md): Truncates the configured PostgreSQL tables in the order they are listed.

### Cluster orchestration

- [OsEditYamlConfigMap](availableProbes/OsEditYamlConfigMap/overview.md): Probe that edits yaml config maps
- [OsChangeDeploymentEnvVars](availableProbes/OsChangeDeploymentEnvVars/overview.md): Probe that changes the environment variables of a deployment
- [OsChangeStatefulSetEnvVars](availableProbes/OsChangeStatefulSetEnvVars/overview.md): Probe that changes the environment variables of a statefulSet
- [OsUpdateDeploymentImage](availableProbes/OsUpdateDeploymentImage/overview.md): Updates the image of one container in a Kubernetes or OpenShift deployment.
- [OsUpdateStatefulSetImage](availableProbes/OsUpdateStatefulSetImage/overview.md): Updates the image of one container in a Kubernetes or OpenShift stateful set.
- [OsExecuteCommandsInContainers](availableProbes/OsExecuteCommandsInContainers/overview.md): Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function
- [OsRestartPods](availableProbes/OsRestartPods/overview.md): Probe that restarts all pods with configured labels in the configured namespace
- [OsUpdateDeploymentResources](availableProbes/OsUpdateDeploymentResources/overview.md): Updates container resource requests and limits in a Kubernetes or OpenShift deployment.
- [OsUpdateStatefulSetResources](availableProbes/OsUpdateStatefulSetResources/overview.md): Updates container resource requests and limits in a Kubernetes or OpenShift stateful set.
- [OsScaleDeploymentPods](availableProbes/OsScaleDeploymentPods/overview.md): Probe that scales openshift deployments
- [OsScaleStatefulSetPods](availableProbes/OsScaleStatefulSetPods/overview.md): Probe that scales openshift statefulsets

<!-- generated hook catalog end -->
