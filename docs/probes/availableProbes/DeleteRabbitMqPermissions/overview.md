# DeleteRabbitMqPermissions

Deletes RabbitMQ user permissions in one or more virtual hosts through the management API.

> Logical group: RabbitMQ administration / Permissions

> Logical group: RabbitMQ administration / Permissions

## What It Does

Deletes RabbitMQ user permissions through the management API.

This is useful when scenario-created access rules should be removed while keeping the users or virtual hosts themselves.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqPermissionsProbe
        Probe: DeleteRabbitMqPermissions
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
```

## What This Configuration Does

This probe removes the permissions granted to `orders-user` on the `orders-vhost` virtual host.

The user and virtual host can continue to exist, but the access rule between them is removed.
