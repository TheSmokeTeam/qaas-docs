# DeleteRabbitMqUsers

Deletes RabbitMQ users through the management API.

## What It Does

Deletes RabbitMQ users through the management API.

This is useful for cleaning up temporary credentials that were created for a scenario or test environment.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqUsersProbe
        Probe: DeleteRabbitMqUsers
        ProbeConfiguration:
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Usernames:
            - orders-user
```

## What This Configuration Does

This configuration removes the RabbitMQ user named `orders-user`.

It is a credential cleanup step for environments that create dedicated users per run or per tenant.
