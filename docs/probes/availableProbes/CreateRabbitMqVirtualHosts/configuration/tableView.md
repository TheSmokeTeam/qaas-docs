---
id: probes.available.createrabbitmqvirtualhosts.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqVirtualHosts, configuration, reference]
summary: "Field-by-field reference for CreateRabbitMqVirtualHosts ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# CreateRabbitMqVirtualHosts Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | `False` | Allow invalid TLS certificates when using HTTPS |
| `ProbeConfiguration.ManagementPort` | `integer or string` | &#10006 | `15672` | Rabbitmq management API port |
| `ProbeConfiguration.ManagementScheme` | `string` | &#10006 | `http` | Rabbitmq management API scheme |
| `ProbeConfiguration.Password` | `string` | &#10006 | `admin` | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | `5672` | Rabbitmq Amqp port |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | `30000` | Rabbitmq management API request timeout in milliseconds |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username` | `string` | &#10006 | `admin` | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | `/` | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.VirtualHosts` | `list or string` | &#10004 |  | The rabbitmq virtual hosts to create or update |
| `ProbeConfiguration.VirtualHosts[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.VirtualHosts[].Name` | `string` | &#10004 |  | The name of the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].DefaultQueueType` | `string or null` | &#10006 |  | Optional default queue type for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Description` | `string or null` | &#10006 |  | Optional description for the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].ProtectedFromDeletion` | `string or true/false or null` | &#10006 |  | Optional deletion protection flag for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Tracing` | `string or true/false or null` | &#10006 |  | Optional tracing flag for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Tags` | `list or string or null` | &#10006 |  | Optional tags for the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].Tags[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
