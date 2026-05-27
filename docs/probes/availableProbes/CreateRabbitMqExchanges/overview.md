---
id: probes.available.createrabbitmqexchanges.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqExchanges, ProbeConfiguration]
summary: "Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqExchanges.cs -->

# CreateRabbitMqExchanges

> TL;DR: Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments.

Creates one or more RabbitMQ exchanges with the configured durability, auto-delete, and arguments.

## What It Does

Creates RabbitMQ exchanges through the AMQP connection defined in the probe configuration.

It is a setup probe for scenarios that need the messaging topology to exist before publishers or consumers start.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqExchangesProbe
        Probe: CreateRabbitMqExchanges
        ProbeConfiguration:
          UseGlobalDict: true
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

## Realistic example

This configuration creates a durable direct exchange named `orders.exchange` in the `/` virtual host.

Because `AutoDelete` is `false`, the exchange remains in place until it is deleted explicitly.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/AmqpDefaults`, and missing `Exchanges` can then be resolved from `RabbitMq/Recovery/Exchanges` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to recreate exchanges that were deleted earlier in the same recovery flow. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
