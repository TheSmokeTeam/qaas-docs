# CreateRabbitMqVirtualHosts

> TL;DR — Creates RabbitMQ virtual hosts through the management API so later probes and sessions can use them.

## When to use

Creates RabbitMQ virtual hosts through the management API.

This is useful when a scenario wants isolated messaging namespaces that can be provisioned and torn down as part of test setup and cleanup.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateRabbitMqVirtualHostsProbe
        Probe: CreateRabbitMqVirtualHosts
        ProbeConfiguration:
          UseGlobalDict: true
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

## Realistic example

This probe creates a virtual host named `orders-vhost` and sets its default queue type to `quorum`.

It gives the scenario a dedicated RabbitMQ namespace for queues, exchanges, and permissions.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing broker connection fields are first resolved from `RabbitMq/AmqpDefaults`, and missing `VirtualHosts` can then be resolved from `RabbitMq/Recovery/VirtualHosts` when a paired delete probe saved recovery state earlier in the same execution and session.

Any key that is present locally still wins, even when the local value is `false`, `0`, an empty string, or an empty collection. This makes the probe useful when you want to restore virtual hosts that were removed during setup or chaos testing. When `UseGlobalDict` is `false`, the probe ignores both aliases and keeps the current local-only behavior.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqVirtualHosts/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqVirtualHosts/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
