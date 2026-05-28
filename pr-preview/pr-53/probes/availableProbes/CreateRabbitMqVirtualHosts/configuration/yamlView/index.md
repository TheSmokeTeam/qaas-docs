# CreateRabbitMqVirtualHosts Configurations Yaml View

> TL;DR: Minimal YAML scaffold for CreateRabbitMqVirtualHosts ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
ProbeConfiguration:
  Host: "value"
  AllowInvalidServerCertificates: "${value}"
  ManagementPort: "${value}"
  ManagementScheme: "http"
  Password: "admin"
  Port: "${value}"
  RequestTimeoutMs: "${value}"
  UseGlobalDict: "${value}"
  Username: "admin"
  VirtualHost: "/"
  VirtualHosts:
    - Name: "value"
      DefaultQueueType: "value"
      Description: "value"
      ProtectedFromDeletion: "${value}"
      Tracing: "${value}"
      Tags:
        - "value"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
