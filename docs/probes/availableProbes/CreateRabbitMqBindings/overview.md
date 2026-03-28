# CreateRabbitMqBindings

Creates RabbitMQ bindings between exchanges and queues or between exchanges by using the configured binding definitions.

## What It Does

Creates RabbitMQ bindings through the AMQP connection defined in the probe configuration.

This is useful when the scenario needs to wire exchanges to queues or exchanges before traffic starts flowing.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqBindingsProbe
        Probe: CreateRabbitMqBindings
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

This probe creates one binding from `orders.exchange` to `orders.queue` using the routing key `orders.created`.

After it runs, messages published to the exchange with that routing key can be routed into the queue.
