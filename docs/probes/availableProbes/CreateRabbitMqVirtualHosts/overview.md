# CreateRabbitMqVirtualHosts

Creates RabbitMQ virtual hosts through the management API so later probes and sessions can use them.

## What It Does

Creates RabbitMQ virtual hosts through the management API.

This is useful when a scenario wants isolated messaging namespaces that can be provisioned and torn down as part of test setup and cleanup.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqVirtualHostsProbe
        Probe: CreateRabbitMqVirtualHosts
        ProbeConfiguration:
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHosts:
            - Name: orders-vhost
              Description: Temporary docs virtual host
              DefaultQueueType: quorum
              ProtectedFromDeletion: false
              Tracing: false
```

## What This Configuration Does

This probe creates a virtual host named `orders-vhost` and sets its default queue type to `quorum`.

It gives the scenario a dedicated RabbitMQ namespace for queues, exchanges, and permissions.
