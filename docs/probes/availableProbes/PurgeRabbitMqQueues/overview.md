# PurgeRabbitMqQueues

Probe that purges rabbitmq queues

> Logical group: RabbitMQ administration / Queues lifecycle

> Logical group: RabbitMQ administration / Queues lifecycle

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
