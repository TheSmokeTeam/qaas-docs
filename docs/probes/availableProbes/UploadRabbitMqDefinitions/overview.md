# UploadRabbitMqDefinitions

Uploads a previously captured RabbitMQ definitions file back into the broker through the management API.

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

This probe reads RabbitMQ definitions from `artifacts/rabbitmq/orders-definitions.json` and uploads them through the management API for the `orders-vhost` environment.

It is a restore step that can recreate a saved topology before the next test run begins.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing management connection fields can be resolved from the session-scoped `RabbitMq/ManagementDefaults` alias when those keys are missing locally. This probe does not use a recovery alias in v1; it only consumes shared RabbitMQ defaults.

That is useful when a restore step should reuse broker credentials that were already stored in the session defaults. When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only its local configuration.
