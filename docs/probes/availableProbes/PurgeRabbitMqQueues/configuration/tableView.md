---
id: probes.available.purgerabbitmqqueues.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, PurgeRabbitMqQueues, configuration, reference]
summary: "Field-by-field reference for PurgeRabbitMqQueues ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# PurgeRabbitMqQueues Configurations Table View

> TL;DR: Field-by-field reference for PurgeRabbitMqQueues ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.QueueNames` | `list or string` | &#10004 |  | A list of the names of all the queues to purge from the given rabbitmq |
| `ProbeConfiguration.QueueNames[]` | `string` | &#10006 |  |  |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
