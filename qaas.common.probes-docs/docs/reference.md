# Probes Reference

## OpenShift / Kubernetes

- `OsProbeConfig`
  - `Openshift`
- `Openshift`
  - `Cluster`
  - `Username`
  - `Password`
  - `Namespace`
- `OsChangeEnvVarsConfig`
  - `ContainerName`
  - `EnvVarsToUpdate`
  - `EnvVarsToRemove`
- `OsEditYamlConfigMapConfig`
  - `ConfigMapName`
  - `ConfigMapYamlFileName`
  - `ValuesToEdit`
- `OsExecuteCommandsInContainersConfig`
  - `ApplicationLabels`
  - `Commands`
  - `ContainerName`
- `OsRestartPodsConfig`
  - `ApplicationLabels`
  - `IntervalBetweenDesiredStateChecksMs`
  - `TimeoutWaitForDesiredStateSeconds`
- `OsScalePodsProbeConfig`
  - `DesiredNumberOfPods`
- `OsUpdateImageProbeConfig`
  - `DesiredImage`
- `OsUpdatePodsProbeConfig`
  - `ReplicaSetName`
  - `IntervalBetweenDesiredStateChecksMs`
  - `TimeoutWaitForDesiredStateSeconds`

## RabbitMQ

- `CreateRabbitMqExchangesConfig`
  - `Exchanges`
- `CreateRabbitMqQueuesConfig`
  - `Queues`
- `DeleteRabbitMqExchangesConfig`
  - `ExchangeNames`
- `DeleteRabbitMqQueuesConfig`
  - `QueueNames`
- `PurgeRabbitMqQueuesConfig`
  - `QueueNames`
- `RabbitMqBindingsConfig`
  - `Bindings`
- `RabbitMqBindingConfig`
  - `SourceName`
  - `DestinationName`
  - `RoutingKey`
  - `Arguments`
  - `BindingType`
- `RabbitMqExchangeConfig`
  - `Name`
  - `Type`
  - `Durable`
  - `AutoDelete`
  - `Arguments`
- `RabbitMqQueueConfig`
  - `Name`
  - `Durable`
  - `Exclusive`
  - `AutoDelete`
  - `Arguments`

## Redis, S3, SQL, and Elastic

- `RedisDataBaseProbeBaseConfig`
  - `RedisDataBase`
- `RedisDataBaseBatchProbeConfig`
  - `BatchSize`
- `EmptyS3BucketConfig`
  - `Prefix`
- `DeleteS3BucketConfig`
  - bucket deletion settings
- `SqlDataBaseTablesTruncateProbeConfig`
  - `ConnectionString`
  - `TableNames`
  - `CommandTimeoutSeconds`
- `EmptyElasticIndicesConfig`
  - elastic index cleanup settings
