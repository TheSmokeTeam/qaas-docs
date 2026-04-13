# CreateRabbitMqUsers Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `string` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | False | Allow invalid TLS certificates when using HTTPS |
| `ProbeConfiguration.ManagementPort` | `integer or string` | &#10006 | 15672 | Rabbitmq management API port |
| `ProbeConfiguration.ManagementScheme` | `string` | &#10006 | http | Rabbitmq management API scheme |
| `ProbeConfiguration.Password` | `string` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `integer or string` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | Rabbitmq management API request timeout in milliseconds |
| `ProbeConfiguration.Username` | `string` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `string` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.Users` | `list or string` | &#10004 |  | The rabbitmq users to create or update |
| `ProbeConfiguration.Users[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Users[].Username` | `string` | &#10004 |  | The rabbitmq user name |
| `ProbeConfiguration.Users[].HashingAlgorithm` | `string or null` | &#10006 |  | Optional hashing algorithm for the password hash |
| `ProbeConfiguration.Users[].Password` | `string or null` | &#10006 |  | Optional password for the rabbitmq user |
| `ProbeConfiguration.Users[].PasswordHash` | `string or null` | &#10006 |  | Optional password hash for the rabbitmq user |
| `ProbeConfiguration.Users[].Tags` | `list or string or null` | &#10006 |  | Optional tags assigned to the rabbitmq user |
| `ProbeConfiguration.Users[].Tags[]` | `string` | &#10006 |  |  |
