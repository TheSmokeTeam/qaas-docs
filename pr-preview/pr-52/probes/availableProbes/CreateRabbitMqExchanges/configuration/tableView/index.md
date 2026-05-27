# CreateRabbitMqExchanges Configurations Table View

> TL;DR: Field-by-field reference for CreateRabbitMqExchanges ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                               | Type                                                          | Required | Default | Description                                                                                                                              |
| ------------------------------------------- | ------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                        | `object or string`                                            | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                   | `string`                                                      | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.Password`               | `string`                                                      | ✖        | admin   | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                   | `integer or string`                                           | ✖        | 5672    | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.UseGlobalDict`          | `string or true/false`                                        | ✖        | False   | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`               | `string`                                                      | ✖        | admin   | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`            | `string`                                                      | ✖        | /       | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.Exchanges`              | `list or string`                                              | ✔        |         | The rabbitmq exchanges to create                                                                                                         |
| `ProbeConfiguration.Exchanges[]`            | `object or string`                                            | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Exchanges[].Name`       | `string`                                                      | ✔        |         | The name of the exchange                                                                                                                 |
| `ProbeConfiguration.Exchanges[].Arguments`  | `object or string or null`                                    | ✖        |         | Extra arguments for the exchange                                                                                                         |
| `ProbeConfiguration.Exchanges[].AutoDelete` | `string or true/false`                                        | ✖        | False   | Should the exchange be autoDelete                                                                                                        |
| `ProbeConfiguration.Exchanges[].Durable`    | `string or true/false`                                        | ✖        | False   | Should the exchange be durable                                                                                                           |
| `ProbeConfiguration.Exchanges[].Type`       | `one of [Fanout / Topic / Direct / Headers / ConsistentHash]` | ✖        |         | The type of the exchange                                                                                                                 |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
