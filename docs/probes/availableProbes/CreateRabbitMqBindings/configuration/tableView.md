---
id: probes.available.createrabbitmqbindings.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqBindings, configuration, reference]
summary: "Field-by-field reference for CreateRabbitMqBindings ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# CreateRabbitMqBindings Configurations Table View

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
| `ProbeConfiguration.Bindings` | `list or string` | &#10004 |  | The rabbitmq bindings |
| `ProbeConfiguration.Bindings[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Bindings[].DestinationName` | `string` | &#10004 |  | The name of the binding's destination |
| `ProbeConfiguration.Bindings[].SourceName` | `string` | &#10004 |  | The name of the binding's source |
| `ProbeConfiguration.Bindings[].Arguments` | `object or string or null` | &#10006 |  | The binding's arguments |
| `ProbeConfiguration.Bindings[].BindingType` | `one of [ExchangeToQueue / ExchangeToExchange]` | &#10006 |  | The type of the binding |
| `ProbeConfiguration.Bindings[].RoutingKey` | `string` | &#10006 | `/` | The binding's routing key |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
