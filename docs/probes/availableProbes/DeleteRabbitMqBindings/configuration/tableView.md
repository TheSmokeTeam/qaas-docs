# DeleteRabbitMqBindings Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `String` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Bindings` | `Array | String` | &#10004 |  | The rabbitmq bindings |
| `ProbeConfiguration.Bindings[]` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Bindings[].DestinationName` | `String` | &#10004 |  | The name of the binding's destination |
| `ProbeConfiguration.Bindings[].SourceName` | `String` | &#10004 |  | The name of the binding's source |
| `ProbeConfiguration.Bindings[].Arguments` | `Null | Object | String` | &#10006 |  | The binding's arguments |
| `ProbeConfiguration.Bindings[].BindingType` | `enum [ExchangeToQueue / ExchangeToExchange]` | &#10006 |  | The type of the binding |
| `ProbeConfiguration.Bindings[].RoutingKey` | `String` | &#10006 | / | The binding's routing key |
