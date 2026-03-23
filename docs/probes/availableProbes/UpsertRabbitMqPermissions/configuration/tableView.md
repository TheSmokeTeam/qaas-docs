# UpsertRabbitMqPermissions Configurations Table View

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
| `ProbeConfiguration.Permissions` | `list or string` | &#10004 |  | The rabbitmq permissions to create or update |
| `ProbeConfiguration.Permissions[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Permissions[].Username` | `string` | &#10004 |  | The rabbitmq user name |
| `ProbeConfiguration.Permissions[].VirtualHostName` | `string` | &#10004 |  | The rabbitmq virtual host name |
| `ProbeConfiguration.Permissions[].Configure` | `string` | &#10006 | .* | Regex for configure permissions |
| `ProbeConfiguration.Permissions[].Read` | `string` | &#10006 | .* | Regex for read permissions |
| `ProbeConfiguration.Permissions[].Write` | `string` | &#10006 | .* | Regex for write permissions |
