# DeleteRabbitMqVirtualHosts

> TL;DR — Deletes RabbitMQ virtual hosts through the management API.

## When to use

Deletes RabbitMQ virtual hosts through the management API.

This is useful when scenario-specific namespaces should be removed entirely after the run is finished.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqVirtualHostsProbe
        Probe: DeleteRabbitMqVirtualHosts
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHostNames:
            - orders-vhost
```

## Realistic example

This probe deletes the `orders-vhost` virtual host through the management API.

It is a full namespace cleanup step for temporary RabbitMQ environments.

### Global Dictionary Behavior

With `UseGlobalDict: true`, the resolved broker settings are saved under the session-scoped `RabbitMq/AmqpDefaults` alias, and this probe also writes the deleted virtual-host names as `RabbitMqVirtualHostConfig[]` to `RabbitMq/Recovery/VirtualHosts`. The canonical payload still lives under `__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>`, so every probe execution keeps its own isolated write path.

That makes the probe useful in recovery or rollback scenarios where `CreateRabbitMqVirtualHosts` runs later in the same execution and session and restores the deleted topology from the saved alias instead of hard-coding it twice. When `UseGlobalDict` is `false`, current behavior stays unchanged: only local YAML or code configuration is used, and nothing is written to the probe global dictionary.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqVirtualHosts/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqVirtualHosts/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
