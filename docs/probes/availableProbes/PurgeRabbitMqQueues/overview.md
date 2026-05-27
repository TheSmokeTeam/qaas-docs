---
id: probes.available.purgerabbitmqqueues.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, PurgeRabbitMqQueues, ProbeConfiguration]
summary: "Probe that purges rabbitmq queues"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\PurgeRabbitMqQueues.cs -->

# PurgeRabbitMqQueues

> TL;DR: Probe that purges rabbitmq queues

Probe that purges rabbitmq queues

## What It Does {: #what-it-does}

Purges all messages from the configured RabbitMQ queues through the AMQP connection, while keeping the queues themselves.

This is useful when the topology should stay in place but leftover messages from a previous run must be removed.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

This configuration purges every message from `orders.queue` without deleting the queue itself.

It is a targeted cleanup step that resets queue contents while preserving the existing topology.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing broker connection fields and `QueueNames` can be resolved from the session-scoped `RabbitMq/AmqpDefaults` alias when those keys are missing locally. This probe does not use a recovery alias in v1; it only consumes shared RabbitMQ defaults.

That is useful when several RabbitMQ maintenance probes share one broker definition without repeating it in every YAML block. When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only its local configuration.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
