# CreateRabbitMqQueues

> TL;DR — Creates one or more RabbitMQ queues with the configured queue arguments.

## When to use

Creates RabbitMQ queues through the AMQP connection defined in the probe configuration.

This is useful for provisioning the queue side of a topology before bindings or message flow start.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqQueuesProbe
        Probe: CreateRabbitMqQueues
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          Queues:
            - Name: orders.queue
              Durable: true
              Exclusive: false
              AutoDelete: false
```

## Realistic example

This probe creates a durable queue named `orders.queue` in the `/` virtual host.

The queue is shared (`Exclusive: false`) and is not removed automatically when consumers disconnect.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/AmqpDefaults`, and missing `Queues` can then be resolved from `RabbitMq/Recovery/Queues` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to recreate queues after a cleanup step. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqQueues/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqQueues/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
