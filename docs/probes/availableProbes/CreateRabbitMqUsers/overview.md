# CreateRabbitMqUsers

Creates RabbitMQ users through the management API with the configured credentials and tags.

## What It Does

Creates RabbitMQ users through the management API.

This is useful when a scenario provisions or resets its own RabbitMQ credentials as part of environment setup.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqUsersProbe
        Probe: CreateRabbitMqUsers
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Users:
            - Username: orders-user
              Password: orders-password
              Tags:
                - administrator
```

## What This Configuration Does

This configuration connects to the RabbitMQ management API and creates a user named `orders-user` with the password `orders-password`.

The user is tagged as `administrator`, so it receives the matching management capabilities in RabbitMQ.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/AmqpDefaults`, and missing `Users` can then be resolved from `RabbitMq/Recovery/Users` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to restore users that were deleted during a test. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.
