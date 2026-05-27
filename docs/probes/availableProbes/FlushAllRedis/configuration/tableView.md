---
id: probes.available.flushallredis.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, FlushAllRedis, configuration, reference]
summary: "Field-by-field reference for FlushAllRedis ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# FlushAllRedis Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.AbortOnConnectFail` | `string or true/false` | &#10006 | `True` | If true, connect will not create connection while no servers are available |
| `ProbeConfiguration.AsyncTimeout` | `integer or string` | &#10006 | `5000` | Time(ms) to allow for asynchronous operations |
| `ProbeConfiguration.ClientName` | `string or null` | &#10006 |  | Identification for the connection within redis |
| `ProbeConfiguration.ConnectRetry` | `integer or string` | &#10006 | `3` | The number of times to repeat connect attempts during initial connect |
| `ProbeConfiguration.KeepAlive` | `integer or string` | &#10006 | `60` | Time (seconds) at which to send a message to help keep alive |
| `ProbeConfiguration.Password` | `string or null` | &#10006 |  | Password for the redis server |
| `ProbeConfiguration.Ssl` | `string or true/false` | &#10006 | `False` | Specifies that SSL encryption should be used |
| `ProbeConfiguration.SslHost` | `string or null` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | `False` | When true, missing Redis probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
| `ProbeConfiguration.Username` | `string or null` | &#10006 |  | User for the redis server |
| `ProbeConfiguration.HostNames` | `list or string` | &#10004 |  | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `ProbeConfiguration.HostNames[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
