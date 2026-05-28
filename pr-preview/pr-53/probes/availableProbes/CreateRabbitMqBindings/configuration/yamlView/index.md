# CreateRabbitMqBindings Configurations Yaml View

> TL;DR: Minimal YAML scaffold for CreateRabbitMqBindings ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
ProbeConfiguration:
  Host: "value"
  Password: "admin"
  Port: "${value}"
  UseGlobalDict: "${value}"
  Username: "admin"
  VirtualHost: "/"
  Bindings:
    - DestinationName: "value"
      SourceName: "value"
      Arguments: "${value}"
      BindingType: "ExchangeToQueue"
      RoutingKey: "/"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
