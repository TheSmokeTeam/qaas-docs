# DeleteRabbitMqExchanges Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `String` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.ExchangeNames` | `Array | String` | &#10004 |  | A list of the names of all the exchanges to delete from the given rabbitmq |
| `ProbeConfiguration.ExchangeNames[]` | `String` | &#10006 |  |  |
