# CreateRabbitMqQueues

Creates one or more RabbitMQ queues with the configured queue arguments.

## What It Does

Creates RabbitMQ queues through the AMQP connection defined in the probe configuration.

This is useful for provisioning the queue side of a topology before bindings or message flow start.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqQueuesProbe
        Probe: CreateRabbitMqQueues
        ProbeConfiguration:
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

## What This Configuration Does

This probe creates a durable queue named `orders.queue` in the `/` virtual host.

The queue is shared (`Exclusive: false`) and is not removed automatically when consumers disconnect.
