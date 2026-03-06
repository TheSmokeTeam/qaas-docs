# RabbitMQ

## Available Probes

- `CreateRabbitMqQueues`
- `DeleteRabbitMqQueues`
- `PurgeRabbitMqQueues`
- `CreateRabbitMqExchanges`
- `DeleteRabbitMqExchanges`
- `CreateRabbitMqBindings`
- `DeleteRabbitMqBindings`

## Common Connection Fields

All RabbitMQ probes share:

| Field | Required | Description |
|---|---|---|
| `Host` | yes | RabbitMQ hostname. |
| `Username` | no | Username. Default: `admin`. |
| `Password` | no | Password. Default: `admin`. |
| `Port` | no | AMQP port. Default: `5672`. |
| `VirtualHost` | no | Virtual host. Default: `/`. |

## Queue, Exchange, And Binding Fields

Queues:

| Field | Description |
|---|---|
| `Name` | Queue name. |
| `Durable` | Whether the queue is durable. |
| `Exclusive` | Whether the queue is exclusive. |
| `AutoDelete` | Whether the queue auto-deletes. |
| `Arguments` | Optional broker-specific queue arguments. |

Exchanges:

| Field | Description |
|---|---|
| `Name` | Exchange name. |
| `Type` | Exchange type. Default: `Fanout`. |
| `Durable` | Whether the exchange is durable. |
| `AutoDelete` | Whether the exchange auto-deletes. |
| `Arguments` | Optional broker-specific exchange arguments. |

Bindings:

| Field | Description |
|---|---|
| `SourceName` | Binding source. |
| `DestinationName` | Binding destination. |
| `RoutingKey` | Routing key. Default: `/`. |
| `Arguments` | Optional binding arguments. |
| `BindingType` | `ExchangeToQueue` or `ExchangeToExchange`. |

Use queue and exchange creation probes to prepare topology, then purge or delete probes to reset state between test runs.
