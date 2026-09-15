# DeleteRabbitMqQueues

> TL;DR — Probe that deletes rabbitmq queues

## When to use

Deletes RabbitMQ queues through the AMQP connection defined in the probe configuration.

This is useful for queue cleanup when the queue should be removed entirely rather than only purged.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqQueuesProbe
        Probe: DeleteRabbitMqQueues
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          QueueNames:
            - orders.queue
```

## Realistic example

This probe deletes the `orders.queue` queue from the `/` virtual host.

Any messages still in the queue are removed along with the queue itself.

### Global Dictionary Behavior

With `UseGlobalDict: true`, the resolved broker settings are saved under the session-scoped `RabbitMq/AmqpDefaults` alias, and this probe also writes the deleted queue names as `RabbitMqQueueConfig[]` to `RabbitMq/Recovery/Queues`. The canonical payload still lives under `__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>`, so every probe execution keeps its own isolated write path.

That makes the probe useful in recovery or rollback scenarios where `CreateRabbitMqQueues` runs later in the same execution and session and restores the deleted topology from the saved alias instead of hard-coding it twice. When `UseGlobalDict` is `false`, current behavior stays unchanged: only local YAML or code configuration is used, and nothing is written to the probe global dictionary.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqQueues/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqQueues/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
