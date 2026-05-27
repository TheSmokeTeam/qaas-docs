# DeleteRabbitMqPermissions

Deletes RabbitMQ user permissions in one or more virtual hosts through the management API.

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
```

## What This Configuration Does

This probe removes the permissions granted to `orders-user` on the `orders-vhost` virtual host.

The user and virtual host can continue to exist, but the access rule between them is removed.

### Global Dictionary Behavior

With `UseGlobalDict: true`, the resolved broker settings are saved under the session-scoped `RabbitMq/ManagementDefaults` alias, and this probe also writes the deleted permissions as full `RabbitMqPermissionConfig[]` payloads to `RabbitMq/Recovery/Permissions`. The canonical payload still lives under `__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>`, so every probe execution keeps its own isolated write path.

That makes the probe useful in recovery or rollback scenarios where `UpsertRabbitMqPermissions` runs later in the same execution and session and restores the deleted topology from the saved alias instead of hard-coding it twice. When `UseGlobalDict` is `false`, current behavior stays unchanged: only local YAML or code configuration is used, and nothing is written to the probe global dictionary.
