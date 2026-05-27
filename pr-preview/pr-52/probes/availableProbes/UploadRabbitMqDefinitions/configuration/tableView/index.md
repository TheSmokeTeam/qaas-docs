# UploadRabbitMqDefinitions Configurations Table View

> TL;DR: Field-by-field reference for UploadRabbitMqDefinitions ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                                       | Type                   | Required | Default | Description                                                                                                                              |
| --------------------------------------------------- | ---------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                | `object or string`     | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                           | `string`               | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | ✖        | False   | Allow invalid TLS certificates when using HTTPS                                                                                          |
| `ProbeConfiguration.DefinitionsFilePath`            | `string or null`       | ✖        |         | Optional path to a JSON file containing rabbitmq definitions                                                                             |
| `ProbeConfiguration.DefinitionsJson`                | `string or null`       | ✖        |         | Optional inline JSON payload with rabbitmq definitions                                                                                   |
| `ProbeConfiguration.ManagementPort`                 | `integer or string`    | ✖        | 15672   | Rabbitmq management API port                                                                                                             |
| `ProbeConfiguration.ManagementScheme`               | `string`               | ✖        | http    | Rabbitmq management API scheme                                                                                                           |
| `ProbeConfiguration.Password`                       | `string`               | ✖        | admin   | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                           | `integer or string`    | ✖        | 5672    | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.RequestTimeoutMs`               | `integer or string`    | ✖        | 30000   | Rabbitmq management API request timeout in milliseconds                                                                                  |
| `ProbeConfiguration.UseGlobalDict`                  | `string or true/false` | ✖        | False   | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                       | `string`               | ✖        | admin   | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`                    | `string`               | ✖        | /       | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.VirtualHostName`                | `string or null`       | ✖        |         | Optional virtual host name for vhost-scoped definitions import                                                                           |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
