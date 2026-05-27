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
          UseGlobalDict: true
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

### Global Dictionary Behavior

With `UseGlobalDict: true`, the resolved broker settings are saved under the session-scoped `RabbitMq/AmqpDefaults` alias, and this probe also writes the deleted exchange names as `RabbitMqExchangeConfig[]` to `RabbitMq/Recovery/Exchanges`. The canonical payload still lives under `__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>`, so every probe execution keeps its own isolated write path.

That makes the probe useful in recovery or rollback scenarios where `CreateRabbitMqExchanges` runs later in the same execution and session and restores the deleted topology from the saved alias instead of hard-coding it twice. When `UseGlobalDict` is `false`, current behavior stays unchanged: only local YAML or code configuration is used, and nothing is written to the probe global dictionary.
