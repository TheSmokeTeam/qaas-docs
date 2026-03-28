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

The built-in hooks below are grouped by implementation type so it is easier to shortlist the right hook before drilling into configuration details.

### RabbitMQ administration

- [CreateRabbitMqBindings](availableProbes/CreateRabbitMqBindings/overview.md): Bindings lifecycle. Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions.
- [DeleteRabbitMqBindings](availableProbes/DeleteRabbitMqBindings/overview.md): Bindings lifecycle. Deletes RabbitMQ bindings using the configured source, destination, routing key, and binding type.
- [DownloadRabbitMqDefinitions](availableProbes/DownloadRabbitMqDefinitions/overview.md): Definitions. Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused.
- [UploadRabbitMqDefinitions](availableProbes/UploadRabbitMqDefinitions/overview.md): Definitions. Uploads a definitions document to the RabbitMQ management API to recreate or synchronize broker topology.
- [CreateRabbitMqExchanges](availableProbes/CreateRabbitMqExchanges/overview.md): Exchanges lifecycle. Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments.
- [DeleteRabbitMqExchanges](availableProbes/DeleteRabbitMqExchanges/overview.md): Exchanges lifecycle. Probe that deletes rabbitmq exchanges
- [DeleteRabbitMqPermissions](availableProbes/DeleteRabbitMqPermissions/overview.md): Permissions. Deletes RabbitMQ user permissions in one or more virtual hosts through the management API.
- [UpsertRabbitMqPermissions](availableProbes/UpsertRabbitMqPermissions/overview.md): Permissions. Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API.
- [CreateRabbitMqQueues](availableProbes/CreateRabbitMqQueues/overview.md): Queues lifecycle. Creates one or more RabbitMQ queues with the configured queue arguments.
- [DeleteRabbitMqQueues](availableProbes/DeleteRabbitMqQueues/overview.md): Queues lifecycle. Probe that deletes rabbitmq queues
- [PurgeRabbitMqQueues](availableProbes/PurgeRabbitMqQueues/overview.md): Queues lifecycle. Probe that purges rabbitmq queues
- [CreateRabbitMqUsers](availableProbes/CreateRabbitMqUsers/overview.md): Users lifecycle. Creates RabbitMQ users through the management API with the configured credentials and tags.
- [DeleteRabbitMqUsers](availableProbes/DeleteRabbitMqUsers/overview.md): Users lifecycle. Deletes RabbitMQ users through the management API.
- [CreateRabbitMqVirtualHosts](availableProbes/CreateRabbitMqVirtualHosts/overview.md): Virtual hosts lifecycle. Creates RabbitMQ virtual hosts through the management API so later probes and sessions can use them.
- [DeleteRabbitMqVirtualHosts](availableProbes/DeleteRabbitMqVirtualHosts/overview.md): Virtual hosts lifecycle. Deletes RabbitMQ virtual hosts through the management API.

### Redis maintenance

- [ExecuteRedisCommand](availableProbes/ExecuteRedisCommand/overview.md): Command execution. Executes one Redis command with optional arguments against the selected Redis database, optionally storing the result for later redisResults placeholder reuse.
- [ExecuteRedisCommands](availableProbes/ExecuteRedisCommands/overview.md): Command execution. Executes multiple Redis commands sequentially against the selected Redis database, allowing later commands to reuse earlier results through redisResults placeholders and optional looping.
- [FlushAllRedis](availableProbes/FlushAllRedis/overview.md): Database flush. Runs Redis FLUSHALL against the configured server to remove keys from every database.
- [FlushDbRedis](availableProbes/FlushDbRedis/overview.md): Database flush. Runs Redis FLUSHDB against the selected Redis database.

### Document stores

- [EmptyElasticIndices](availableProbes/EmptyElasticIndices/overview.md): Elastic indices. Empties elastic indices by their index pattern
- [EmptyMongoDbCollection](availableProbes/EmptyMongoDbCollection/overview.md): MongoDB collections. Deletes all documents from the configured MongoDB collection so it starts clean for the test run.

### Object storage

- [DeleteS3Bucket](availableProbes/DeleteS3Bucket/overview.md): S3 bucket deletion. Probe to delete a s3 bucket
- [EmptyS3Bucket](availableProbes/EmptyS3Bucket/overview.md): S3 cleanup. Probe to empty a s3 bucket according to a certain prefix

### SQL maintenance

- [MsSqlDataBaseTablesTruncate](availableProbes/MsSqlDataBaseTablesTruncate/overview.md): Microsoft SQL tables. Truncates the configured Microsoft SQL Server tables in the order they are listed.
- [OracleSqlDataBaseTablesTruncate](availableProbes/OracleSqlDataBaseTablesTruncate/overview.md): Oracle SQL tables. Truncates the configured Oracle tables in the order they are listed.
- [PostgreSqlDataBaseTablesTruncate](availableProbes/PostgreSqlDataBaseTablesTruncate/overview.md): PostgreSQL tables. Truncates the configured PostgreSQL tables in the order they are listed.

### Cluster orchestration

- [OsEditYamlConfigMap](availableProbes/OsEditYamlConfigMap/overview.md): Config maps. Probe that edits yaml config maps
- [OsChangeDeploymentEnvVars](availableProbes/OsChangeDeploymentEnvVars/overview.md): Environment variables. Probe that changes the environment variables of a deployment
- [OsChangeStatefulSetEnvVars](availableProbes/OsChangeStatefulSetEnvVars/overview.md): Environment variables. Probe that changes the environment variables of a statefulSet
- [OsUpdateDeploymentImage](availableProbes/OsUpdateDeploymentImage/overview.md): Image rollout. Updates the image of one container in a Kubernetes or OpenShift deployment.
- [OsUpdateStatefulSetImage](availableProbes/OsUpdateStatefulSetImage/overview.md): Image rollout. Updates the image of one container in a Kubernetes or OpenShift stateful set.
- [OsExecuteCommandsInContainers](availableProbes/OsExecuteCommandsInContainers/overview.md): In-container commands. Probe that Executes a command passed by the `cmd` string variable on every pod and container if passed to the function
- [OsRestartPods](availableProbes/OsRestartPods/overview.md): Pod restarts. Probe that restarts all pods with configured labels in the configured namespace
- [OsUpdateDeploymentResources](availableProbes/OsUpdateDeploymentResources/overview.md): Resource tuning. Updates container resource requests and limits in a Kubernetes or OpenShift deployment.
- [OsUpdateStatefulSetResources](availableProbes/OsUpdateStatefulSetResources/overview.md): Resource tuning. Updates container resource requests and limits in a Kubernetes or OpenShift stateful set.
- [OsScaleDeploymentPods](availableProbes/OsScaleDeploymentPods/overview.md): Scaling. Probe that scales openshift deployments
- [OsScaleStatefulSetPods](availableProbes/OsScaleStatefulSetPods/overview.md): Scaling. Probe that scales openshift stateful sets

### Other

- [EmptyRedisByChunks](availableProbes/EmptyRedisByChunks/overview.md): EmptyRedisByChunks. Scans the selected Redis database in batches and deletes matching keys, optionally filtering them by a regular expression.

<!-- generated hook catalog end -->
