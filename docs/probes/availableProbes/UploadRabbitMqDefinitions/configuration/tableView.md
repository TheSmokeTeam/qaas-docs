# UploadRabbitMqDefinitions Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Host` | `String` | &#10004 |  | Rabbitmq hostname |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `Boolean | String` | &#10006 | False | Allow invalid TLS certificates when using HTTPS |
| `ProbeConfiguration.DefinitionsFilePath` | `Null | String` | &#10006 |  | Optional path to a JSON file containing rabbitmq definitions |
| `ProbeConfiguration.DefinitionsJson` | `Null | String` | &#10006 |  | Optional inline JSON payload with rabbitmq definitions |
| `ProbeConfiguration.ManagementPort` | `Integer | String` | &#10006 | 15672 | Rabbitmq management API port |
| `ProbeConfiguration.ManagementScheme` | `String` | &#10006 | http | Rabbitmq management API scheme |
| `ProbeConfiguration.Password` | `String` | &#10006 | admin | Rabbitmq password |
| `ProbeConfiguration.Port` | `Integer | String` | &#10006 | 5672 | Rabbitmq Amqp port |
| `ProbeConfiguration.RequestTimeoutMs` | `Integer | String` | &#10006 | 30000 | Rabbitmq management API request timeout in milliseconds |
| `ProbeConfiguration.Username` | `String` | &#10006 | admin | Rabbitmq username |
| `ProbeConfiguration.VirtualHost` | `String` | &#10006 | / | Rabbitmq virtual host to access during this connection |
| `ProbeConfiguration.VirtualHostName` | `Null | String` | &#10006 |  | Optional virtual host name for vhost-scoped definitions import |
