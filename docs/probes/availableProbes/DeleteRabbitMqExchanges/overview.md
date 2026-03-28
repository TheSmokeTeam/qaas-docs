# DeleteRabbitMqExchanges

Probe that deletes rabbitmq exchanges

## What It Does

Deletes RabbitMQ exchanges through the AMQP connection defined in the probe configuration.

This is useful when an exchange was created for a temporary scenario and should be removed cleanly afterward.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqExchangesProbe
        Probe: DeleteRabbitMqExchanges
        ProbeConfiguration:
          Host: rabbitmq.local
          Port: 5672
          Username: guest
          Password: guest
          VirtualHost: /
          ExchangeNames:
            - orders.exchange
```

## What This Configuration Does

This configuration deletes the `orders.exchange` exchange from the `/` virtual host.

It is a topology cleanup step that removes the exchange but leaves other RabbitMQ objects untouched.
