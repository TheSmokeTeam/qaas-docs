# CreateRabbitMqUsers

> TL;DR — Creates RabbitMQ users through the management API with the configured credentials and tags.

## When to use

Creates RabbitMQ users through the management API.

This is useful when a scenario provisions or resets its own RabbitMQ credentials as part of environment setup.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

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

## Realistic example

This configuration connects to the RabbitMQ management API and creates a user named `orders-user` with the password `orders-password`.

The user is tagged as `administrator`, so it receives the matching management capabilities in RabbitMQ.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/AmqpDefaults`, and missing `Users` can then be resolved from `RabbitMq/Recovery/Users` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to restore users that were deleted during a test. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqUsers/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqUsers/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
