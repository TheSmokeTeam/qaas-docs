---
id: probes.available.createrabbitmqqueues.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqQueues, configuration, reference]
summary: "Field-by-field reference for CreateRabbitMqQueues ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# CreateRabbitMqQueues Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | `admin` | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | `5672` | Rabbitmq Amqp port |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username` | `string` | &#10006 | `admin` | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | `/` | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Queues` | `list or string` | &#10004 |  | The rabbitmq queues to create |
| `ProbeConfiguration.Queues[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Queues[].Exclusive` | `string or true/false` | &#10004 | `False` | Should the queue be exclusive |
| `ProbeConfiguration.Queues[].Name` | `string` | &#10004 |  | The name of the queue |
| `ProbeConfiguration.Queues[].Arguments` | `object or string or null` | &#10006 |  | Extra arguments for the queue |
| `ProbeConfiguration.Queues[].AutoDelete` | `string or true/false` | &#10006 | `True` | Should the queue be autoDelete |
| `ProbeConfiguration.Queues[].Durable` | `string or true/false` | &#10006 | `False` | Should the exchange be durable |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
