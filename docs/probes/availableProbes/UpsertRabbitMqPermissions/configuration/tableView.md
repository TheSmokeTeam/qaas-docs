# UpsertRabbitMqPermissions Configurations Table View

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
| `ProbeConfiguration.Permissions` | `Array | String` | &#10004 |  | The rabbitmq permissions to create or update |
| `ProbeConfiguration.Permissions[]` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Permissions[].Username` | `String` | &#10004 |  | The rabbitmq user name |
| `ProbeConfiguration.Permissions[].VirtualHostName` | `String` | &#10004 |  | The rabbitmq virtual host name |
| `ProbeConfiguration.Permissions[].Configure` | `String` | &#10006 | .* | Regex for configure permissions |
| `ProbeConfiguration.Permissions[].Read` | `String` | &#10006 | .* | Regex for read permissions |
| `ProbeConfiguration.Permissions[].Write` | `String` | &#10006 | .* | Regex for write permissions |
