# DeleteRabbitMqBindings Configurations Table View

> TL;DR: Field-by-field reference for DeleteRabbitMqBindings ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                                   | Type                                            | Required | Default | Description                                                                                                                              |
| ----------------------------------------------- | ----------------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                            | `object or string`                              | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                       | `string`                                        | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.Password`                   | `string`                                        | ✖        | admin   | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                       | `integer or string`                             | ✖        | 5672    | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.UseGlobalDict`              | `string or true/false`                          | ✖        | False   | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                   | `string`                                        | ✖        | admin   | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`                | `string`                                        | ✖        | /       | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.Bindings`                   | `list or string`                                | ✔        |         | The rabbitmq bindings                                                                                                                    |
| `ProbeConfiguration.Bindings[]`                 | `object or string`                              | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Bindings[].DestinationName` | `string`                                        | ✔        |         | The name of the binding's destination                                                                                                    |
| `ProbeConfiguration.Bindings[].SourceName`      | `string`                                        | ✔        |         | The name of the binding's source                                                                                                         |
| `ProbeConfiguration.Bindings[].Arguments`       | `object or string or null`                      | ✖        |         | The binding's arguments                                                                                                                  |
| `ProbeConfiguration.Bindings[].BindingType`     | `one of [ExchangeToQueue / ExchangeToExchange]` | ✖        |         | The type of the binding                                                                                                                  |
| `ProbeConfiguration.Bindings[].RoutingKey`      | `string`                                        | ✖        | /       | The binding's routing key                                                                                                                |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
