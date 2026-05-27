---
id: probes.available.deleterabbitmqusers.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteRabbitMqUsers, configuration, reference]
summary: "Field-by-field reference for DeleteRabbitMqUsers ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# DeleteRabbitMqUsers Configurations Table View

> TL;DR: Field-by-field reference for DeleteRabbitMqUsers ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | False | Allow invalid TLS certificates when using HTTPS |
| `ProbeConfiguration.ManagementPort` | `integer or string` | &#10006 | 15672 | Rabbitmq management API port |
| `ProbeConfiguration.ManagementScheme` | `string` | &#10006 | http | Rabbitmq management API scheme |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | Rabbitmq management API request timeout in milliseconds |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Usernames` | `list or string` | &#10004 |  | The rabbitmq users to delete |
| `ProbeConfiguration.Usernames[]` | `string` | &#10006 |  |  |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
