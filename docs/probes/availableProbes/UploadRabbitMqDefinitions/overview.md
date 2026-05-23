---
id: probes.available.uploadrabbitmqdefinitions.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, UploadRabbitMqDefinitions, ProbeConfiguration]
summary: "Uploads a previously captured RabbitMQ definitions file back into the broker through the management API."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\UploadRabbitMqDefinitions.cs -->

# UploadRabbitMqDefinitions

> TL;DR — Uploads a previously captured RabbitMQ definitions file back into the broker through the management API.

## When to use {: #when-to-use}

Uploads RabbitMQ definitions through the management API from either an inline JSON payload or a JSON file.

This is useful for restoring a known topology snapshot before the scenario starts.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: UploadRabbitMqDefinitionsProbe
        Probe: UploadRabbitMqDefinitions
        ProbeConfiguration:
          UseGlobalDict: true
          Host: rabbitmq.local
          ManagementScheme: http
          ManagementPort: 15672
          Username: guest
          Password: guest
          VirtualHost: /
          VirtualHostName: orders-vhost
          DefinitionsFilePath: artifacts/rabbitmq/orders-definitions.json
```

## Realistic example {: #realistic-example}

This probe reads RabbitMQ definitions from `artifacts/rabbitmq/orders-definitions.json` and uploads them through the management API for the `orders-vhost` environment.

It is a restore step that can recreate a saved topology before the next test run begins.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing management connection fields can be resolved from the session-scoped `RabbitMq/ManagementDefaults` alias when those keys are missing locally. This probe does not use a recovery alias in v1; it only consumes shared RabbitMQ defaults.

That is useful when a restore step should reuse broker credentials that were already stored in the session defaults. When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only its local configuration.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Probes](../../index.md)
