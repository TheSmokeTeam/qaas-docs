<!-- generated hash:83e266df36f7 sources:runner-family, CreateRabbitMqExchanges, table-view -->

# CreateRabbitMqExchanges Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Exchanges` | `list or string` | &#10004 |  | The rabbitmq exchanges to create |
| `ProbeConfiguration.Exchanges[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Exchanges[].Name` | `string` | &#10004 |  | The name of the exchange |
| `ProbeConfiguration.Exchanges[].Arguments` | `object or string or null` | &#10006 |  | Extra arguments for the exchange |
| `ProbeConfiguration.Exchanges[].AutoDelete` | `string or true/false` | &#10006 | False | Should the exchange be autoDelete |
| `ProbeConfiguration.Exchanges[].Durable` | `string or true/false` | &#10006 | False | Should the exchange be durable |
| `ProbeConfiguration.Exchanges[].Type` | `one of [Fanout / Topic / Direct / Headers / ConsistentHash]` | &#10006 |  | The type of the exchange |
