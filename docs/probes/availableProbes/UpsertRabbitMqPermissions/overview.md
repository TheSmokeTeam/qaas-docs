# UpsertRabbitMqPermissions

Creates or updates RabbitMQ permissions for users in one or more virtual hosts through the management API.

> Logical group: RabbitMQ administration / Permissions

> Logical group: RabbitMQ administration / Permissions

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
