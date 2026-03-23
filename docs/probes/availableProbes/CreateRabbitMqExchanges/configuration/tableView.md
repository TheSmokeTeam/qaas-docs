# CreateRabbitMqExchanges Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `String` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Exchanges` | `Array | String` | &#10004 |  | The rabbitmq exchanges to create |
| `ProbeConfiguration.Exchanges[]` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Exchanges[].Name` | `String` | &#10004 |  | The name of the exchange |
| `ProbeConfiguration.Exchanges[].Arguments` | `Null | Object | String` | &#10006 |  | Extra arguments for the exchange |
| `ProbeConfiguration.Exchanges[].AutoDelete` | `Boolean | String` | &#10006 | False | Should the exchange be autoDelete |
| `ProbeConfiguration.Exchanges[].Durable` | `Boolean | String` | &#10006 | False | Should the exchange be durable |
| `ProbeConfiguration.Exchanges[].Type` | `enum [Fanout / Topic / Direct / Headers / ConsistentHash]` | &#10006 |  | The type of the exchange |
