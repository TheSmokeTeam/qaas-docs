---
id: probes.available.createrabbitmqbindings.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/CreateRabbitMqBindings/overview.md]
code_langs: [yaml]
keywords: [probes, CreateRabbitMqBindings, configuration, reference]
ai_summary: "Field-by-field reference for CreateRabbitMqBindings ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
tags: [probes]
canonical_url: /probes/availableProbes/CreateRabbitMqBindings/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# CreateRabbitMqBindings — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Bindings` | `array or string` | &#10004 |  | The rabbitmq bindings |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
