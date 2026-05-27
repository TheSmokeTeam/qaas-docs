---
id: probes.available.downloadrabbitmqdefinitions.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DownloadRabbitMqDefinitions, ProbeConfiguration]
summary: "Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DownloadRabbitMqDefinitions.cs -->

# DownloadRabbitMqDefinitions

> TL;DR: Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused.

Downloads RabbitMQ definitions from the management API so the current topology can be captured and reused.

## What It Does {: #what-it-does}

Downloads RabbitMQ definitions through the management API and writes them to a JSON file.

This is useful for snapshotting an existing RabbitMQ topology before a run changes it, or for exporting a topology that should later be restored elsewhere.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DownloadRabbitMqDefinitionsProbe
        Probe: DownloadRabbitMqDefinitions
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

This probe connects to the RabbitMQ management API and saves the definitions for `orders-vhost` into `artifacts/rabbitmq/orders-definitions.json`.

The resulting file can be used as an environment snapshot or as input for a later upload step.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing management connection fields can be resolved from the session-scoped `RabbitMq/ManagementDefaults` alias when those keys are missing locally. This probe does not use a recovery alias in v1; it only consumes shared RabbitMQ defaults.

That is useful when a backup step should reuse the same broker credentials that were already resolved by an earlier RabbitMQ management probe. When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only its local configuration.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
