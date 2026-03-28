# DownloadRabbitMqDefinitions

Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused.

> Logical group: RabbitMQ administration / Definitions

> Logical group: RabbitMQ administration / Definitions

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
