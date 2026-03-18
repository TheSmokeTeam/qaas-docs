# Probes

Probes are **hooks** that manipulate infrastructure before or after sessions run. They are typically used for setup and cleanup tasks such as creating queues, flushing caches, scaling pods, truncating tables, or deleting data.

The **QaaS.Common.Probes** NuGet package ships the built-in probe library. You can author custom probes by implementing `BaseProbe<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                  |
|----------------|------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Probes`                                             |
| **Source**     | [Repository - QaaS.Common.Probes]({{ links.repository_probes }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)               |

## Installation

```xml
<PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
```

## Available Probes

| Probe                                                                                            | Category        | Purpose                                        |
|--------------------------------------------------------------------------------------------------|-----------------|------------------------------------------------|
| [OsRestartPods](availableProbes/OsRestartPods/overview.md)                                       | Kubernetes / OS | Restart pods by label selector                 |
| [OsExecuteCommandsInContainers](availableProbes/OsExecuteCommandsInContainers/overview.md)       | Kubernetes / OS | Run shell commands inside containers           |
| [OsEditYamlConfigMap](availableProbes/OsEditYamlConfigMap/overview.md)                           | Kubernetes / OS | Patch a ConfigMap's YAML data                  |
| [OsScaleDeploymentPods](availableProbes/OsScaleDeploymentPods/overview.md)                       | Kubernetes / OS | Scale a Deployment replica count               |
| [OsScaleStatefulSetPods](availableProbes/OsScaleStatefulSetPods/overview.md)                     | Kubernetes / OS | Scale a StatefulSet replica count              |
| [OsChangeDeploymentEnvVars](availableProbes/OsChangeDeploymentEnvVars/overview.md)               | Kubernetes / OS | Update Deployment environment variables        |
| [OsChangeStatefulSetEnvVars](availableProbes/OsChangeStatefulSetEnvVars/overview.md)             | Kubernetes / OS | Update StatefulSet environment variables       |
| [OsUpdateDeploymentImage](availableProbes/OsUpdateDeploymentImage/overview.md)                   | Kubernetes / OS | Change a Deployment container image            |
| [OsUpdateStatefulSetImage](availableProbes/OsUpdateStatefulSetImage/overview.md)                 | Kubernetes / OS | Change a StatefulSet container image           |
| [OsUpdateDeploymentResources](availableProbes/OsUpdateDeploymentResources/overview.md)           | Kubernetes / OS | Modify Deployment CPU/memory limits            |
| [OsUpdateStatefulSetResources](availableProbes/OsUpdateStatefulSetResources/overview.md)         | Kubernetes / OS | Modify StatefulSet CPU/memory limits           |
| [CreateRabbitMqQueues](availableProbes/CreateRabbitMqQueues/overview.md)                         | RabbitMQ        | Declare queues                                 |
| [CreateRabbitMqExchanges](availableProbes/CreateRabbitMqExchanges/overview.md)                   | RabbitMQ        | Declare exchanges                              |
| [CreateRabbitMqBindings](availableProbes/CreateRabbitMqBindings/overview.md)                     | RabbitMQ        | Bind queues to exchanges                       |
| [DeleteRabbitMqQueues](availableProbes/DeleteRabbitMqQueues/overview.md)                         | RabbitMQ        | Delete queues                                  |
| [DeleteRabbitMqExchanges](availableProbes/DeleteRabbitMqExchanges/overview.md)                   | RabbitMQ        | Delete exchanges                               |
| [DeleteRabbitMqBindings](availableProbes/DeleteRabbitMqBindings/overview.md)                     | RabbitMQ        | Remove bindings                                |
| [PurgeRabbitMqQueues](availableProbes/PurgeRabbitMqQueues/overview.md)                           | RabbitMQ        | Purge all messages from queues                 |
| [FlushAllRedis](availableProbes/FlushAllRedis/overview.md)                                       | Redis           | `FLUSHALL` - wipe entire Redis instance        |
| [FlushDbRedis](availableProbes/FlushDbRedis/overview.md)                                         | Redis           | `FLUSHDB` - wipe a single database             |
| [EmptyRedisByChunks](availableProbes/EmptyRedisByChunks/overview.md)                             | Redis           | Delete keys matching a pattern in batches      |
| [EmptyS3Bucket](availableProbes/EmptyS3Bucket/overview.md)                                       | S3              | Remove all objects from a bucket               |
| [DeleteS3Bucket](availableProbes/DeleteS3Bucket/overview.md)                                     | S3              | Delete the bucket itself                       |
| [MsSqlDataBaseTablesTruncate](availableProbes/MsSqlDataBaseTablesTruncate/overview.md)           | SQL             | Truncate tables in SQL Server                  |
| [PostgreSqlDataBaseTablesTruncate](availableProbes/PostgreSqlDataBaseTablesTruncate/overview.md) | SQL             | Truncate tables in PostgreSQL                  |
| [OracleSqlDataBaseTablesTruncate](availableProbes/OracleSqlDataBaseTablesTruncate/overview.md)   | SQL             | Truncate tables in Oracle                      |
| [EmptyElasticIndices](availableProbes/EmptyElasticIndices/overview.md)                           | Elasticsearch   | Delete documents from indices matching a regex |

## Writing Custom Probes

See [Write Hooks](../qaas/quickStart/writeHooks.md) for the pattern.

## Generated Docs Contract

The external hook automation is expected to emit one folder per probe under `availableProbes/<ProbeName>/` with:

* `overview.md`
* `configuration/tableView.md`
* `configuration/yamlView.md`
