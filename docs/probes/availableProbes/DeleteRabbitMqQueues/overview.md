# DeleteRabbitMqQueues

Probe that deletes rabbitmq queues

## What It Does

Deletes RabbitMQ queues through the AMQP connection defined in the probe configuration.

This is useful for queue cleanup when the queue should be removed entirely instead of just purged.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqQueuesProbe
        Probe: DeleteRabbitMqQueues
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

This probe deletes the `orders.queue` queue from the `/` virtual host.

Any messages still in the queue are removed along with the queue itself.
