---
id: probes.available.createrabbitmqexchanges.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqExchanges, configuration, reference]
summary: "Field-by-field reference for CreateRabbitMqExchanges ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# CreateRabbitMqExchanges Configurations Table View

> TL;DR: Field-by-field reference for CreateRabbitMqExchanges ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Exchanges` | `list or string` | &#10004 |  | The rabbitmq exchanges to create |
| `ProbeConfiguration.Exchanges[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Exchanges[].Name` | `string` | &#10004 |  | The name of the exchange |
| `ProbeConfiguration.Exchanges[].Arguments` | `object or string or null` | &#10006 |  | Extra arguments for the exchange |
| `ProbeConfiguration.Exchanges[].AutoDelete` | `string or true/false` | &#10006 | False | Should the exchange be autoDelete |
| `ProbeConfiguration.Exchanges[].Durable` | `string or true/false` | &#10006 | False | Should the exchange be durable |
| `ProbeConfiguration.Exchanges[].Type` | `one of [Fanout / Topic / Direct / Headers / ConsistentHash]` | &#10006 |  | The type of the exchange |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
