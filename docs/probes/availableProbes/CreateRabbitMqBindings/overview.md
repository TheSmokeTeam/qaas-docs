---
id: probes.available.createrabbitmqbindings.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqBindings, ProbeConfiguration]
summary: "Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqBindings.cs -->

# CreateRabbitMqBindings

> TL;DR — Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions.

## When to use {: #when-to-use}

Creates RabbitMQ bindings through the AMQP connection defined in the probe configuration.

This is useful when the scenario needs to wire exchanges to queues or exchanges before traffic starts flowing.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqBindingsProbe
        Probe: CreateRabbitMqBindings
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

## Realistic example {: #realistic-example}

This probe creates one binding from `orders.exchange` to `orders.queue` using the routing key `orders.created`.

After it runs, messages published to the exchange with that routing key can be routed into the queue.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/AmqpDefaults`, and missing `Bindings` can then be resolved from `RabbitMq/Recovery/Bindings` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to recreate bindings after deleting and later restoring a topology slice. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Probes](../../index.md)
