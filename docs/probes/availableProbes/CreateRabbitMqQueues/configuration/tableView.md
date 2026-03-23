# CreateRabbitMqQueues Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `String` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Queues` | `Array | String` | &#10004 |  | The rabbitmq queues to create |
| `ProbeConfiguration.Queues[]` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Queues[].Exclusive` | `Boolean | String` | &#10004 | False | Should the queue be exclusive |
| `ProbeConfiguration.Queues[].Name` | `String` | &#10004 |  | The name of the queue |
| `ProbeConfiguration.Queues[].Arguments` | `Null | Object | String` | &#10006 |  | Extra arguments for the queue |
| `ProbeConfiguration.Queues[].AutoDelete` | `Boolean | String` | &#10006 | True | Should the queue be autoDelete |
| `ProbeConfiguration.Queues[].Durable` | `Boolean | String` | &#10006 | False | Should the exchange be durable |
