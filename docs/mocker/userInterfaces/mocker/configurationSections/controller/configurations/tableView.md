---
id: mocker.userinterfaces.mocker.configurationsections.controller.configurations.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, controller, configurations, tableview]
summary: "Controller Configurations Table View"
---

<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->

# Controller Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Controller` | `object or string` | &#10006 |  | The server mocker controller configuration |
| `Controller.ServerName` | `string or null` | &#10006 |  | The Server name |
| `Controller.Redis` | `object or string` | &#10006 |  | The Server Controller Redis API |
| `Controller.Redis.AbortOnConnectFail` | `string or true/false` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `Controller.Redis.AsyncTimeout` | `integer or string` | &#10006 | 5000 | Time(ms) to allow for asynchronous operations |
| `Controller.Redis.ClientName` | `string or null` | &#10006 |  | Identification for the connection within redis |
| `Controller.Redis.ConnectRetry` | `integer or string` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `Controller.Redis.Host` | `string` | &#10006 |  | Redis hostname (should contain the port too for example: - 'host1:8080') |
| `Controller.Redis.KeepAlive` | `integer or string` | &#10006 | 60 | Time (seconds) at which to send a message to help keep alive |
| `Controller.Redis.Password` | `string or null` | &#10006 |  | Password for the redis server |
| `Controller.Redis.RedisDataBase` | `integer or string` | &#10006 | 0 | Redis database to use |
| `Controller.Redis.Ssl` | `string or true/false` | &#10006 | False | Specifies that SSL encryption should be used |
| `Controller.Redis.SslHost` | `string or null` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `Controller.Redis.Username` | `string or null` | &#10006 |  | User for the redis server |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
