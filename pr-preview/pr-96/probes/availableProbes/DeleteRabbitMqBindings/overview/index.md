# DeleteRabbitMqBindings

> TL;DR — Deletes RabbitMQ bindings using the configured source, destination, routing key, and binding type.

## When to use

Deletes RabbitMQ bindings through the AMQP connection defined in the probe configuration.

This is the inverse of `CreateRabbitMqBindings` and is useful when a topology should be removed without deleting the queues or exchanges themselves.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqBindingsProbe
        Probe: DeleteRabbitMqBindings
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          Bindings:
            - SourceName: orders.exchange
              DestinationName: orders.queue
              BindingType: ExchangeToQueue
              RoutingKey: orders.created
```

## Realistic example

This probe removes the binding from `orders.exchange` to `orders.queue` for the routing key `orders.created`.

After it runs, that routing path no longer exists even though the queue and exchange can remain in place.

### Global Dictionary Behavior

With `UseGlobalDict: true`, the resolved broker settings are saved under the session-scoped `RabbitMq/AmqpDefaults` alias, and this probe also writes the deleted bindings as full `RabbitMqBindingConfig[]` payloads to `RabbitMq/Recovery/Bindings`. The canonical payload still lives under `__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>`, so every probe execution keeps its own isolated write path.

That makes the probe useful in recovery or rollback scenarios where `CreateRabbitMqBindings` runs later in the same execution and session and restores the deleted topology from the saved alias instead of hard-coding it twice. When `UseGlobalDict` is `false`, current behavior stays unchanged: only local YAML or code configuration is used, and nothing is written to the probe global dictionary.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqBindings/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqBindings/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
