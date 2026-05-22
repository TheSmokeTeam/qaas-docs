---
id: probes.available.downloadrabbitmqdefinitions.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/DownloadRabbitMqDefinitions/overview.md]
code_langs: [yaml]
keywords: [probes, DownloadRabbitMqDefinitions, configuration, reference]
ai_summary: "Field-by-field reference for DownloadRabbitMqDefinitions ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
tags: [probes]
canonical_url: /probes/availableProbes/DownloadRabbitMqDefinitions/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# DownloadRabbitMqDefinitions — Configuration (table view)

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
| `ProbeConfiguration.DefinitionsFilePath` | `string` | &#10004 |  | Output path for the downloaded rabbitmq definitions JSON |
| `ProbeConfiguration.VirtualHostName` | `null or string` | &#10006 |  | Optional virtual host name for vhost-scoped definitions export |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
