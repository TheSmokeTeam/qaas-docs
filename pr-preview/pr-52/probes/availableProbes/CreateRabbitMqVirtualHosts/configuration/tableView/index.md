# CreateRabbitMqVirtualHosts Configurations Table View

> TL;DR: Field-by-field reference for CreateRabbitMqVirtualHosts ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                                             | Type                           | Required | Default | Description                                                                                                                              |
| --------------------------------------------------------- | ------------------------------ | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                      | `object or string`             | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                                 | `string`                       | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.AllowInvalidServerCertificates`       | `string or true/false`         | ✖        | False   | Allow invalid TLS certificates when using HTTPS                                                                                          |
| `ProbeConfiguration.ManagementPort`                       | `integer or string`            | ✖        | 15672   | Rabbitmq management API port                                                                                                             |
| `ProbeConfiguration.ManagementScheme`                     | `string`                       | ✖        | http    | Rabbitmq management API scheme                                                                                                           |
| `ProbeConfiguration.Password`                             | `string`                       | ✖        | admin   | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                                 | `integer or string`            | ✖        | 5672    | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.RequestTimeoutMs`                     | `integer or string`            | ✖        | 30000   | Rabbitmq management API request timeout in milliseconds                                                                                  |
| `ProbeConfiguration.UseGlobalDict`                        | `string or true/false`         | ✖        | False   | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                             | `string`                       | ✖        | admin   | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`                          | `string`                       | ✖        | /       | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.VirtualHosts`                         | `list or string`               | ✔        |         | The rabbitmq virtual hosts to create or update                                                                                           |
| `ProbeConfiguration.VirtualHosts[]`                       | `object or string`             | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.VirtualHosts[].Name`                  | `string`                       | ✔        |         | The name of the rabbitmq virtual host                                                                                                    |
| `ProbeConfiguration.VirtualHosts[].DefaultQueueType`      | `string or null`               | ✖        |         | Optional default queue type for the virtual host                                                                                         |
| `ProbeConfiguration.VirtualHosts[].Description`           | `string or null`               | ✖        |         | Optional description for the rabbitmq virtual host                                                                                       |
| `ProbeConfiguration.VirtualHosts[].ProtectedFromDeletion` | `string or true/false or null` | ✖        |         | Optional deletion protection flag for the virtual host                                                                                   |
| `ProbeConfiguration.VirtualHosts[].Tracing`               | `string or true/false or null` | ✖        |         | Optional tracing flag for the virtual host                                                                                               |
| `ProbeConfiguration.VirtualHosts[].Tags`                  | `list or string or null`       | ✖        |         | Optional tags for the rabbitmq virtual host                                                                                              |
| `ProbeConfiguration.VirtualHosts[].Tags[]`                | `string`                       | ✖        |         |                                                                                                                                          |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
