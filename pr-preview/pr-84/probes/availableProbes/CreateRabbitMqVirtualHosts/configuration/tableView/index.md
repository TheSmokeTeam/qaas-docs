# CreateRabbitMqVirtualHosts Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                             | Type                           | Required | Default | Description                                                                                                                              |
| --------------------------------------------------------- | ------------------------------ | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                      | `object or string`             | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                                 | `string`                       | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.AllowInvalidServerCertificates`       | `string or true/false`         | ✖        | `False` | Allow invalid TLS certificates when using HTTPS                                                                                          |
| `ProbeConfiguration.ManagementPort`                       | `integer or string`            | ✖        | `15672` | Rabbitmq management API port                                                                                                             |
| `ProbeConfiguration.ManagementScheme`                     | `string`                       | ✖        | `http`  | Rabbitmq management API scheme                                                                                                           |
| `ProbeConfiguration.Password`                             | `string`                       | ✖        | `admin` | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                                 | `integer or string`            | ✖        | `5672`  | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.RequestTimeoutMs`                     | `integer or string`            | ✖        | `30000` | Rabbitmq management API request timeout in milliseconds                                                                                  |
| `ProbeConfiguration.UseGlobalDict`                        | `string or true/false`         | ✖        | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                             | `string`                       | ✖        | `admin` | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`                          | `string`                       | ✖        | `/`     | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.VirtualHosts`                         | `list or string`               | ✔        |         | The rabbitmq virtual hosts to create or update                                                                                           |
| `ProbeConfiguration.VirtualHosts[]`                       | `object or string`             | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.VirtualHosts[].Name`                  | `string`                       | ✔        |         | The name of the rabbitmq virtual host                                                                                                    |
| `ProbeConfiguration.VirtualHosts[].DefaultQueueType`      | `string or null`               | ✖        |         | Optional default queue type for the virtual host                                                                                         |
| `ProbeConfiguration.VirtualHosts[].Description`           | `string or null`               | ✖        |         | Optional description for the rabbitmq virtual host                                                                                       |
| `ProbeConfiguration.VirtualHosts[].ProtectedFromDeletion` | `string or true/false or null` | ✖        |         | Optional deletion protection flag for the virtual host                                                                                   |
| `ProbeConfiguration.VirtualHosts[].Tracing`               | `string or true/false or null` | ✖        |         | Optional tracing flag for the virtual host                                                                                               |
| `ProbeConfiguration.VirtualHosts[].Tags`                  | `list or string or null`       | ✖        |         | Optional tags for the rabbitmq virtual host                                                                                              |
| `ProbeConfiguration.VirtualHosts[].Tags[]`                | `string`                       | ✖        |         |                                                                                                                                          |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqVirtualHosts/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/CreateRabbitMqVirtualHosts/overview/index.md)
