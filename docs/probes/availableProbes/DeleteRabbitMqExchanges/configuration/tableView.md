<!-- generated hash:73c0712e08da sources:runner-family, DeleteRabbitMqExchanges, table-view -->

# DeleteRabbitMqExchanges Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.ExchangeNames` | `list or string` | &#10004 |  | A list of the names of all the exchanges to delete from the given rabbitmq |
| `ProbeConfiguration.ExchangeNames[]` | `string` | &#10006 |  |  |
