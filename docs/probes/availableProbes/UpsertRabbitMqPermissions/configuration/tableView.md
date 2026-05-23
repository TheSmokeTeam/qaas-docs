---
id: probes.available.upsertrabbitmqpermissions.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, UpsertRabbitMqPermissions, configuration, reference]
summary: "Field-by-field reference for UpsertRabbitMqPermissions ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# UpsertRabbitMqPermissions Configurations Table View

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
| `ProbeConfiguration.Permissions` | `list or string` | &#10004 |  | The rabbitmq permissions to create or update |
| `ProbeConfiguration.Permissions[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Permissions[].Username` | `string` | &#10004 |  | The rabbitmq user name |
| `ProbeConfiguration.Permissions[].VirtualHostName` | `string` | &#10004 |  | The rabbitmq virtual host name |
| `ProbeConfiguration.Permissions[].Configure` | `string` | &#10006 | `.*` | Regex for configure permissions |
| `ProbeConfiguration.Permissions[].Read` | `string` | &#10006 | `.*` | Regex for read permissions |
| `ProbeConfiguration.Permissions[].Write` | `string` | &#10006 | `.*` | Regex for write permissions |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
