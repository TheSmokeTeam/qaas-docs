---
id: probes.available.executerediscommand.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, ExecuteRedisCommand, configuration, reference]
summary: "Field-by-field reference for ExecuteRedisCommand ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# ExecuteRedisCommand — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.RedisDataBase` | `integer or string` | &#10006 | 0 | Redis database to perform the probe on |
| `ProbeConfiguration.HostNames` | `array or string` | &#10004 |  | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `ProbeConfiguration.Username` | `null or string` | &#10006 |  | User for the redis server |
| `ProbeConfiguration.Password` | `null or string` | &#10006 |  | Password for the redis server |
| `ProbeConfiguration.AbortOnConnectFail` | `boolean or string` | &#10006 | true | If true, connect will not create connection while no servers are available |
| `ProbeConfiguration.ConnectRetry` | `integer or string` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `ProbeConfiguration.ClientName` | `null or string` | &#10006 |  | Identification for the connection within redis |
| `ProbeConfiguration.AsyncTimeout` | `integer or string` | &#10006 | 5000 | Time(ms) to allow for asynchronous operations |
| `ProbeConfiguration.Ssl` | `boolean or string` | &#10006 | false | Specifies that SSL encryption should be used |
| `ProbeConfiguration.SslHost` | `null or string` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `ProbeConfiguration.KeepAlive` | `integer or string` | &#10006 | 60 | Time (seconds) at which to send a message to help keep alive |
| `ProbeConfiguration.Command` | `string` | &#10004 |  | The redis command to execute |
| `ProbeConfiguration.Arguments` | `array or null or string` | &#10006 |  | Optional redis command arguments |
| `ProbeConfiguration.StoreResultAs` | `null or string` | &#10006 |  | Optional alias used to store the command result for later redisResults placeholders |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
