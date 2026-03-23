# CreateRabbitMqVirtualHosts Configurations Table View

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
| `ProbeConfiguration.VirtualHosts` | `Array | String` | &#10004 |  | The rabbitmq virtual hosts to create or update |
| `ProbeConfiguration.VirtualHosts[]` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.VirtualHosts[].Name` | `String` | &#10004 |  | The name of the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].DefaultQueueType` | `Null | String` | &#10006 |  | Optional default queue type for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Description` | `Null | String` | &#10006 |  | Optional description for the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].ProtectedFromDeletion` | `Boolean | Null | String` | &#10006 |  | Optional deletion protection flag for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Tracing` | `Boolean | Null | String` | &#10006 |  | Optional tracing flag for the virtual host |
| `ProbeConfiguration.VirtualHosts[].Tags` | `Array | Null | String` | &#10006 |  | Optional tags for the rabbitmq virtual host |
| `ProbeConfiguration.VirtualHosts[].Tags[]` | `String` | &#10006 |  |  |
