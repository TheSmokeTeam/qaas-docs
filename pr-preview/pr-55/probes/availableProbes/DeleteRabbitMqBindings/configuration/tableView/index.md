# DeleteRabbitMqBindings Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                   | Type                                            | Required | Default | Description                                                                                                                              |
| ----------------------------------------------- | ----------------------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                            | `object or string`                              | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                       | `string`                                        | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.Password`                   | `string`                                        | ✖        | `admin` | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                       | `integer or string`                             | ✖        | `5672`  | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.UseGlobalDict`              | `string or true/false`                          | ✖        | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                   | `string`                                        | ✖        | `admin` | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`                | `string`                                        | ✖        | `/`     | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.Bindings`                   | `list or string`                                | ✔        |         | The rabbitmq bindings                                                                                                                    |
| `ProbeConfiguration.Bindings[]`                 | `object or string`                              | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Bindings[].DestinationName` | `string`                                        | ✔        |         | The name of the binding's destination                                                                                                    |
| `ProbeConfiguration.Bindings[].SourceName`      | `string`                                        | ✔        |         | The name of the binding's source                                                                                                         |
| `ProbeConfiguration.Bindings[].Arguments`       | `object or string or null`                      | ✖        |         | The binding's arguments                                                                                                                  |
| `ProbeConfiguration.Bindings[].BindingType`     | `one of [ExchangeToQueue / ExchangeToExchange]` | ✖        |         | The type of the binding                                                                                                                  |
| `ProbeConfiguration.Bindings[].RoutingKey`      | `string`                                        | ✖        | `/`     | The binding's routing key                                                                                                                |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqBindings/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteRabbitMqBindings/overview/index.md)
