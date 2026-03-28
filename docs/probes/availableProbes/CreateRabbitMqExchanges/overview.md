# CreateRabbitMqExchanges

Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments.

> Logical group: RabbitMQ administration / Exchanges lifecycle

## What It Does

Creates RabbitMQ exchanges through the AMQP connection defined in the probe configuration.

It is a setup probe for scenarios that need the messaging topology to exist before publishers or consumers start.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqExchangesProbe
        Probe: CreateRabbitMqExchanges
        ProbeConfiguration:
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          Exchanges:
            - Name: orders.exchange
              Type: Direct
              Durable: true
              AutoDelete: false
```

## What This Configuration Does

This configuration creates a durable direct exchange named `orders.exchange` in the `/` virtual host.

Because `AutoDelete` is `false`, the exchange remains in place until it is deleted explicitly.
