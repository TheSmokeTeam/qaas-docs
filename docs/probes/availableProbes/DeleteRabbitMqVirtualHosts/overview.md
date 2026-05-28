---
id: probes.available.deleterabbitmqvirtualhosts.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteRabbitMqVirtualHosts, ProbeConfiguration]
summary: "Deletes RabbitMQ virtual hosts through the management API."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqVirtualHosts.cs -->

# DeleteRabbitMqVirtualHosts

> TL;DR: Deletes RabbitMQ virtual hosts through the management API.

Deletes RabbitMQ virtual hosts through the management API.

## What It Does {: #what-it-does}

Deletes RabbitMQ virtual hosts through the management API.

This is useful when scenario-specific namespaces should be removed entirely after the run is finished.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

This probe deletes the `orders-vhost` virtual host through the management API.

It is a full namespace cleanup step for temporary RabbitMQ environments.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, the resolved broker settings are saved under the session-scoped `RabbitMq/AmqpDefaults` alias, and this probe also writes the deleted virtual-host names as `RabbitMqVirtualHostConfig[]` to `RabbitMq/Recovery/VirtualHosts`. The canonical payload still lives under `__ProbeGlobalDict/Scoped/<execution-scope>/<session-name>/<probe-name>`, so every probe execution keeps its own isolated write path.

That makes the probe useful in recovery or rollback scenarios where `CreateRabbitMqVirtualHosts` runs later in the same execution and session and restores the deleted topology from the saved alias instead of hard-coding it twice. When `UseGlobalDict` is `false`, current behavior stays unchanged: only local YAML or code configuration is used, and nothing is written to the probe global dictionary.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
