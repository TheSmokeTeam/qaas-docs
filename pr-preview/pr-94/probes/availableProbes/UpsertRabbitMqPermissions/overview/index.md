# UpsertRabbitMqPermissions

> TL;DR — Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API.

## When to use

Creates or updates RabbitMQ user permissions through the management API.

This is useful when a scenario needs to ensure a user has the expected configure, write, and read access patterns on one virtual host.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: UpsertRabbitMqPermissionsProbe
        Probe: UpsertRabbitMqPermissions
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Permissions:
            - Username: orders-user
              VirtualHostName: orders-vhost
              Configure: '^orders\..*'
              Write: '^orders\..*'
              Read: '^orders\..*'
```

## Realistic example

This configuration grants `orders-user` matching configure, write, and read permissions on the `orders-vhost` virtual host for names that start with `orders.`.

If the permission rule already exists, it is updated in place; otherwise it is created.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/ManagementDefaults`, and missing `Permissions` can then be resolved from `RabbitMq/Recovery/Permissions` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to restore permission sets after deleting or rolling back broker access. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/UpsertRabbitMqPermissions/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/UpsertRabbitMqPermissions/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
