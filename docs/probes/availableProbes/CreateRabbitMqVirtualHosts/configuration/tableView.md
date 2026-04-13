# CreateRabbitMqVirtualHosts Configurations Table View

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
| `ProbeConfiguration.VirtualHosts` | `list or string` | &#10004 |  | The rabbitmq virtual hosts to create or update |
| `ProbeConfiguration.VirtualHosts[]` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.VirtualHosts[].Name` | `string` | &#10004 |  | The name of the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].DefaultQueueType` | `string or null` | &#10006 |  | Optional default queue type for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Description` | `string or null` | &#10006 |  | Optional description for the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].ProtectedFromDeletion` | `string or true/false or null` | &#10006 |  | Optional deletion protection flag for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Tracing` | `string or true/false or null` | &#10006 |  | Optional tracing flag for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Tags` | `list or string or null` | &#10006 |  | Optional tags for the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].Tags[]` | `string` | &#10006 |  |  |
