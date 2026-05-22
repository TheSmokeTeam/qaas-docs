---
id: probes.available.uploadrabbitmqdefinitions.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, UploadRabbitMqDefinitions, configuration, reference]
summary: "Field-by-field reference for UploadRabbitMqDefinitions ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# UploadRabbitMqDefinitions — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ManagementScheme` | `string` | &#10006 | http | Rabbitmq management API scheme |
| `ProbeConfiguration.ManagementPort` | `integer or string` | &#10006 | 15672 | Rabbitmq management API port |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `boolean or string` | &#10006 | false | Allow invalid TLS certificates when using HTTPS |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | Rabbitmq management API request timeout in milliseconds |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.DefinitionsJson` | `null or string` | &#10006 |  | Optional inline JSON payload with rabbitmq definitions |
| `ProbeConfiguration.DefinitionsFilePath` | `null or string` | &#10006 |  | Optional path to a JSON file containing rabbitmq definitions |
| `ProbeConfiguration.VirtualHostName` | `null or string` | &#10006 |  | Optional virtual host name for vhost-scoped definitions import |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
