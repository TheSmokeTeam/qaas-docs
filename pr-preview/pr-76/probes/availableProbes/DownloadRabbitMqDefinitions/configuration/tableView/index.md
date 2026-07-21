# DownloadRabbitMqDefinitions Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                       | Type                   | Required | Default | Description                                                                                                                              |
| --------------------------------------------------- | ---------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                | `object or string`     | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.DefinitionsFilePath`            | `string`               | ✔        |         | Output path for the downloaded rabbitmq definitions JSON                                                                                 |
| `ProbeConfiguration.Host`                           | `string`               | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | ✖        | `False` | Allow invalid TLS certificates when using HTTPS                                                                                          |
| `ProbeConfiguration.ManagementPort`                 | `integer or string`    | ✖        | `15672` | Rabbitmq management API port                                                                                                             |
| `ProbeConfiguration.ManagementScheme`               | `string`               | ✖        | `http`  | Rabbitmq management API scheme                                                                                                           |
| `ProbeConfiguration.Password`                       | `string`               | ✖        | `admin` | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                           | `integer or string`    | ✖        | `5672`  | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.RequestTimeoutMs`               | `integer or string`    | ✖        | `30000` | Rabbitmq management API request timeout in milliseconds                                                                                  |
| `ProbeConfiguration.UseGlobalDict`                  | `string or true/false` | ✖        | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                       | `string`               | ✖        | `admin` | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`                    | `string`               | ✖        | `/`     | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.VirtualHostName`                | `string or null`       | ✖        |         | Optional virtual host name for vhost-scoped definitions export                                                                           |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DownloadRabbitMqDefinitions/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DownloadRabbitMqDefinitions/overview/index.md)
