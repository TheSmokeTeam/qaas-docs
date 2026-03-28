# DeleteRabbitMqBindings

Deletes RabbitMQ bindings using the configured source, destination, routing key, and binding type.

## What It Does

Deletes RabbitMQ bindings through the AMQP connection defined in the probe configuration.

This is the inverse of `CreateRabbitMqBindings` and is useful when a topology should be removed without deleting the queues or exchanges themselves.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqBindingsProbe
        Probe: DeleteRabbitMqBindings
        ProbeConfiguration:
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

## What This Configuration Does

This probe removes the binding from `orders.exchange` to `orders.queue` for the routing key `orders.created`.

After it runs, that routing path no longer exists even though the queue and exchange can remain in place.
