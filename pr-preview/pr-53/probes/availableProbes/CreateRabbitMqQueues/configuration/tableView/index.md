# CreateRabbitMqQueues Configurations Table View

> TL;DR: Field-by-field reference for CreateRabbitMqQueues ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                            | Type                       | Required | Default | Description                                                                                                                              |
| ---------------------------------------- | -------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                     | `object or string`         | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`                | `string`                   | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.Password`            | `string`                   | ✖        | admin   | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`                | `integer or string`        | ✖        | 5672    | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.UseGlobalDict`       | `string or true/false`     | ✖        | False   | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`            | `string`                   | ✖        | admin   | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`         | `string`                   | ✖        | /       | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.Queues`              | `list or string`           | ✔        |         | The rabbitmq queues to create                                                                                                            |
| `ProbeConfiguration.Queues[]`            | `object or string`         | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Queues[].Exclusive`  | `string or true/false`     | ✔        | False   | Should the queue be exclusive                                                                                                            |
| `ProbeConfiguration.Queues[].Name`       | `string`                   | ✔        |         | The name of the queue                                                                                                                    |
| `ProbeConfiguration.Queues[].Arguments`  | `object or string or null` | ✖        |         | Extra arguments for the queue                                                                                                            |
| `ProbeConfiguration.Queues[].AutoDelete` | `string or true/false`     | ✖        | True    | Should the queue be autoDelete                                                                                                           |
| `ProbeConfiguration.Queues[].Durable`    | `string or true/false`     | ✖        | False   | Should the exchange be durable                                                                                                           |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
