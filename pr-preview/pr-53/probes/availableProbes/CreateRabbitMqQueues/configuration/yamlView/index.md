# CreateRabbitMqQueues Configurations Yaml View

> TL;DR: Minimal YAML scaffold for CreateRabbitMqQueues ProbeConfiguration — copy, fill the blanks, drop into a Session step.

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
  Queues:
    - Exclusive: "${value}"
      Name: "value"
      Arguments: "${value}"
      AutoDelete: "${value}"
      Durable: "${value}"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
