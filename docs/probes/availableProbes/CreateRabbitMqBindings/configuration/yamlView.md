---
id: probes.available.createrabbitmqbindings.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, CreateRabbitMqBindings, yaml, scaffold]
summary: "Minimal YAML scaffold for CreateRabbitMqBindings ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# CreateRabbitMqBindings Configurations Yaml View

> TL;DR: Minimal YAML scaffold for CreateRabbitMqBindings ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
