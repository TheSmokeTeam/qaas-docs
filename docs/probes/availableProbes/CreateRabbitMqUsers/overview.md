# CreateRabbitMqUsers

Creates RabbitMQ users through the management API with the configured credentials and tags.

> Logical group: RabbitMQ administration / Users lifecycle

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
