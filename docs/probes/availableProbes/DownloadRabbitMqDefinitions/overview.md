# DownloadRabbitMqDefinitions

Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused.

## What It Does

Downloads RabbitMQ definitions through the management API and writes them to a JSON file.

This is useful for snapshotting an existing RabbitMQ topology before a run changes it, or for exporting a topology that should later be restored elsewhere.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DownloadRabbitMqDefinitionsProbe
        Probe: DownloadRabbitMqDefinitions
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHostName: orders-vhost
          DefinitionsFilePath: artifacts/rabbitmq/orders-definitions.json
```

## What This Configuration Does

This probe connects to the RabbitMQ management API and saves the definitions for `orders-vhost` into `artifacts/rabbitmq/orders-definitions.json`.

The resulting file can be used as an environment snapshot or as input for a later upload step.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing management connection fields can be resolved from the session-scoped `RabbitMq/ManagementDefaults` alias when those keys are missing locally. This probe does not use a recovery alias in v1; it only consumes shared RabbitMQ defaults.

That is useful when a backup step should reuse the same broker credentials that were already resolved by an earlier RabbitMQ management probe. When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only its local configuration.
