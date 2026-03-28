# DeleteRabbitMqVirtualHosts

Deletes RabbitMQ virtual hosts through the management API.

## What It Does

Deletes RabbitMQ virtual hosts through the management API.

This is useful when scenario-specific namespaces should be removed entirely after the run is finished.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqVirtualHostsProbe
        Probe: DeleteRabbitMqVirtualHosts
        ProbeConfiguration:
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHostNames:
            - orders-vhost
```

## What This Configuration Does

This probe deletes the `orders-vhost` virtual host through the management API.

It is a full namespace cleanup step for temporary RabbitMQ environments.
