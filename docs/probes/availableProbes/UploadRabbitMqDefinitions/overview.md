# UploadRabbitMqDefinitions

Uploads a definitions document to the RabbitMQ management API to recreate or synchronize broker topology.

> Logical group: RabbitMQ administration / Definitions

> Logical group: RabbitMQ administration / Definitions

## What It Does

Uploads RabbitMQ definitions through the management API from either an inline JSON payload or a JSON file.

This is useful for restoring a known topology snapshot before the scenario starts.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: UploadRabbitMqDefinitionsProbe
        Probe: UploadRabbitMqDefinitions
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

This probe reads RabbitMQ definitions from `artifacts/rabbitmq/orders-definitions.json` and uploads them through the management API for the `orders-vhost` environment.

It is a restore step that can recreate a saved topology before the next test run begins.
