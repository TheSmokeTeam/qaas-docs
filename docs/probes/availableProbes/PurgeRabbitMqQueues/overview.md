# PurgeRabbitMqQueues

Probe that purges rabbitmq queues

## What It Does

Purges all messages from the configured RabbitMQ queues through the AMQP connection, while keeping the queues themselves.

This is useful when the topology should stay in place but leftover messages from a previous run must be removed.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: PurgeRabbitMqQueuesProbe
        Probe: PurgeRabbitMqQueues
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

## What This Configuration Does

This configuration purges every message from `orders.queue` without deleting the queue itself.

It is a targeted cleanup step that resets queue contents while preserving the existing topology.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields and `QueueNames` can be resolved from the session-scoped `RabbitMq/AmqpDefaults` alias when those keys are missing locally. This probe does not use a recovery alias in v1; it only consumes shared RabbitMQ defaults.

That is useful when several RabbitMQ maintenance probes share one broker definition without repeating it in every YAML block. When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only its local configuration.
