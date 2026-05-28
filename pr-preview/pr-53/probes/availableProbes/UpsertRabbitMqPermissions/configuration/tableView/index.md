# UpsertRabbitMqPermissions Configurations Table View

> TL;DR: Field-by-field reference for UpsertRabbitMqPermissions ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                                       | Type                   | Required | Default | Description                                                                                                                              |
| --------------------------------------------------- | ---------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                | `object or string`     | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                           | `string`               | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | ✖        | False   | Allow invalid TLS certificates when using HTTPS                                                                                          |
| `ProbeConfiguration.ManagementPort`                 | `integer or string`    | ✖        | 15672   | Rabbitmq management API port                                                                                                             |
| `ProbeConfiguration.ManagementScheme`               | `string`               | ✖        | http    | Rabbitmq management API scheme                                                                                                           |
| `ProbeConfiguration.Password`                       | `string`               | ✖        | admin   | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                           | `integer or string`    | ✖        | 5672    | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.RequestTimeoutMs`               | `integer or string`    | ✖        | 30000   | Rabbitmq management API request timeout in milliseconds                                                                                  |
| `ProbeConfiguration.UseGlobalDict`                  | `string or true/false` | ✖        | False   | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                       | `string`               | ✖        | admin   | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`                    | `string`               | ✖        | /       | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.Permissions`                    | `list or string`       | ✔        |         | The rabbitmq permissions to create or update                                                                                             |
| `ProbeConfiguration.Permissions[]`                  | `object or string`     | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Permissions[].Username`         | `string`               | ✔        |         | The rabbitmq user name                                                                                                                   |
| `ProbeConfiguration.Permissions[].VirtualHostName`  | `string`               | ✔        |         | The rabbitmq virtual host name                                                                                                           |
| `ProbeConfiguration.Permissions[].Configure`        | `string`               | ✖        | .\*     | Regex for configure permissions                                                                                                          |
| `ProbeConfiguration.Permissions[].Read`             | `string`               | ✖        | .\*     | Regex for read permissions                                                                                                               |
| `ProbeConfiguration.Permissions[].Write`            | `string`               | ✖        | .\*     | Regex for write permissions                                                                                                              |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
