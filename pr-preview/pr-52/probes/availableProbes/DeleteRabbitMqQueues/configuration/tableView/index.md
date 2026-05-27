# DeleteRabbitMqQueues Configurations Table View

> TL;DR: Field-by-field reference for DeleteRabbitMqQueues ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                      | Type                   | Required | Default | Description                                                                                                                              |
| ---------------------------------- | ---------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`               | `object or string`     | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Host`          | `string`               | ✔        |         | Rabbitmq hostname                                                                                                                        |
| `ProbeConfiguration.Password`      | `string`               | ✖        | admin   | Rabbitmq password                                                                                                                        |
| `ProbeConfiguration.Port`          | `integer or string`    | ✖        | 5672    | Rabbitmq Amqp port                                                                                                                       |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | ✖        | False   | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`      | `string`               | ✖        | admin   | Rabbitmq username                                                                                                                        |
| `ProbeConfiguration.VirtualHost`   | `string`               | ✖        | /       | Rabbitmq virtual host to access during this connection                                                                                   |
| `ProbeConfiguration.QueueNames`    | `list or string`       | ✔        |         | A list of the names of all the queues to delete from the given rabbitmq                                                                  |
| `ProbeConfiguration.QueueNames[]`  | `string`               | ✖        |         |                                                                                                                                          |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
