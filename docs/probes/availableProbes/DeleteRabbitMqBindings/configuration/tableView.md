# DeleteRabbitMqBindings Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Bindings` | `list or string` | &#10004 |  | The rabbitmq bindings |
| `ProbeConfiguration.Bindings[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Bindings[].DestinationName` | `string` | &#10004 |  | The name of the binding's destination |
| `ProbeConfiguration.Bindings[].SourceName` | `string` | &#10004 |  | The name of the binding's source |
| `ProbeConfiguration.Bindings[].Arguments` | `object or string or null` | &#10006 |  | The binding's arguments |
| `ProbeConfiguration.Bindings[].BindingType` | `one of [ExchangeToQueue / ExchangeToExchange]` | &#10006 |  | The type of the binding |
| `ProbeConfiguration.Bindings[].RoutingKey` | `string` | &#10006 | / | The binding's routing key |
