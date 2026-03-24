<!-- generated hash:b30c14ca9a0c sources:runner-family, PurgeRabbitMqQueues, table-view -->

# PurgeRabbitMqQueues Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.QueueNames` | `list or string` | &#10004 |  | A list of the names of all the queues to purge from the given rabbitmq |
| `ProbeConfiguration.QueueNames[]` | `string` | &#10006 |  |  |
