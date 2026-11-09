# DeleteRabbitMqUsers

> TL;DR — Deletes RabbitMQ users through the management API.

## When to use

Deletes RabbitMQ users through the management API.

This is useful for cleaning up temporary credentials that were created for a scenario or test environment.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteRabbitMqUsersProbe
        Probe: DeleteRabbitMqUsers
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          Usernames:
            - orders-user
```

## Realistic example

This configuration removes the RabbitMQ user named `orders-user`.

It is a credential cleanup step for environments that create dedicated users per run or per tenant.

### Global Dictionary Behavior

With `UseGlobalDict: true`, the resolved broker settings are saved under the session-scoped `RabbitMq/AmqpDefaults` alias, and this probe also writes the deleted user names as `RabbitMqUserConfig[]` to `RabbitMq/Recovery/Users`. The canonical payload still lives under `__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>`, so every probe execution keeps its own isolated write path.

That makes the probe useful in recovery or rollback scenarios where `CreateRabbitMqUsers` runs later in the same execution and session and restores the deleted topology from the saved alias instead of hard-coding it twice. When `UseGlobalDict` is `false`, current behavior stays unchanged: only local YAML or code configuration is used, and nothing is written to the probe global dictionary.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqUsers/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqUsers/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
