# Probes

Probes are side-effect hooks that manipulate infrastructure **before or after** sessions run — creating queues, flushing caches, scaling pods, truncating tables, etc. They implement `IProbe` / `BaseProbe<TConfig>` and are referenced by class name in YAML.

## Installation

```xml
<PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
```

## Available Probes

### Kubernetes / OS

| Probe | Description |
|---|---|
| `OsRestartPods` | Restart pods by label selector |
| `OsExecuteCommandsInContainers` | Run shell commands inside containers |
| `OsEditYamlConfigMap` | Patch a ConfigMap's YAML data |
| `OsScaleDeploymentPods` | Scale a Deployment replica count |
| `OsScaleStatefulSetPods` | Scale a StatefulSet replica count |
| `OsChangeDeploymentEnvVars` | Update Deployment environment variables |
| `OsChangeStatefulSetEnvVars` | Update StatefulSet environment variables |
| `OsUpdateDeploymentImage` | Change a Deployment container image |
| `OsUpdateStatefulSetImage` | Change a StatefulSet container image |
| `OsUpdateDeploymentResources` | Modify Deployment CPU/memory limits |
| `OsUpdateStatefulSetResources` | Modify StatefulSet CPU/memory limits |

### RabbitMQ

| Probe | Description |
|---|---|
| `CreateRabbitMqQueues` | Declare queues |
| `CreateRabbitMqExchanges` | Declare exchanges |
| `CreateRabbitMqBindings` | Bind queues to exchanges |
| `DeleteRabbitMqQueues` | Delete queues |
| `DeleteRabbitMqExchanges` | Delete exchanges |
| `DeleteRabbitMqBindings` | Remove bindings |
| `PurgeRabbitMqQueues` | Purge all messages from queues |

### Redis

| Probe | Description |
|---|---|
| `FlushAllRedis` | `FLUSHALL` — wipe entire Redis instance |
| `FlushDbRedis` | `FLUSHDB` — wipe a single database |
| `EmptyRedisByChunks` | Delete keys matching a pattern in batches |

### S3

| Probe | Description |
|---|---|
| `EmptyS3Bucket` | Remove all objects from a bucket |
| `DeleteS3Bucket` | Delete the bucket itself |

### SQL

| Probe | Description |
|---|---|
| `MsSqlDataBaseTablesTruncate` | Truncate tables in SQL Server |
| `PostgreSqlDataBaseTablesTruncate` | Truncate tables in PostgreSQL |
| `OracleSqlDataBaseTablesTruncate` | Truncate tables in Oracle |

### Elasticsearch

| Probe | Description |
|---|---|
| `EmptyElasticIndices` | Delete documents from indices matching a regex |

## YAML Example

```yaml
Sessions:
  - Name: Setup
    Probes:
      - Name: FlushRedis
        Probe: FlushAllRedis
        ProbeConfiguration:
          Host: redis
          Port: 6379
      - Name: CreateQueue
        Probe: CreateRabbitMqQueues
        ProbeConfiguration:
          Host: rabbitmq
          Port: 5672
          Username: admin
          Password: admin
          Queues:
            - Name: input-queue
              Durable: true
```

## Writing Custom Probes

See [Write Hooks](../qaas/quickStart/writeHooks.md#probe) for the pattern.
