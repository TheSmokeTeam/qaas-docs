<!-- generated hash:77cc6f069ba3 sources:runner-family, CreateRabbitMqQueues, table-view -->

# CreateRabbitMqQueues Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Queues` | `list or string` | &#10004 |  | The rabbitmq queues to create |
| `ProbeConfiguration.Queues[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Queues[].Exclusive` | `string or true/false` | &#10004 | False | Should the queue be exclusive |
| `ProbeConfiguration.Queues[].Name` | `string` | &#10004 |  | The name of the queue |
| `ProbeConfiguration.Queues[].Arguments` | `object or string or null` | &#10006 |  | Extra arguments for the queue |
| `ProbeConfiguration.Queues[].AutoDelete` | `string or true/false` | &#10006 | True | Should the queue be autoDelete |
| `ProbeConfiguration.Queues[].Durable` | `string or true/false` | &#10006 | False | Should the exchange be durable |
