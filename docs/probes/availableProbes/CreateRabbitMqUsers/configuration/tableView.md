# CreateRabbitMqUsers Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `Boolean | String` | &#10006 | False | Allow invalid TLS certificates when using HTTPS |
| `ProbeConfiguration.ManagementPort` | `Integer | String` | &#10006 | 15672 | Rabbitmq management API port |
| `ProbeConfiguration.ManagementScheme` | `String` | &#10006 | http | Rabbitmq management API scheme |
| `ProbeConfiguration.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.RequestTimeoutMs` | `Integer | String` | &#10006 | 30000 | Rabbitmq management API request timeout in milliseconds |
| `ProbeConfiguration.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `String` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Users` | `Array | String` | &#10004 |  | The rabbitmq users to create or update |
| `ProbeConfiguration.Users[]` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Users[].Username` | `String` | &#10004 |  | The rabbitmq user name |
| `ProbeConfiguration.Users[].HashingAlgorithm` | `Null | String` | &#10006 |  | Optional hashing algorithm for the password hash |
| `ProbeConfiguration.Users[].Password` | `Null | String` | &#10006 |  | Optional password for the rabbitmq user |
| `ProbeConfiguration.Users[].PasswordHash` | `Null | String` | &#10006 |  | Optional password hash for the rabbitmq user |
| `ProbeConfiguration.Users[].Tags` | `Array | Null | String` | &#10006 |  | Optional tags assigned to the rabbitmq user |
| `ProbeConfiguration.Users[].Tags[]` | `String` | &#10006 |  |  |
