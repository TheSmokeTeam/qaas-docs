# UpsertRabbitMqPermissions

Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API.

## What It Does

Creates or updates RabbitMQ user permissions through the management API.

This is useful when a scenario needs to ensure a user has the expected configure, write, and read access patterns on one virtual host.

## YAML Example

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

## What This Configuration Does

This configuration grants `orders-user` matching configure, write, and read permissions on the `orders-vhost` virtual host for names that start with `orders.`.

If the permission rule already exists, it is updated in place; otherwise it is created.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/ManagementDefaults`, and missing `Permissions` can then be resolved from `RabbitMq/Recovery/Permissions` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to restore permission sets after deleting or rolling back broker access. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.
