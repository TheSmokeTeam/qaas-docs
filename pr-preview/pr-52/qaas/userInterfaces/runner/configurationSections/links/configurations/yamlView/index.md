# Links Configurations Yaml View

> TL;DR: Link configuration YAML example.

```yaml
Links:
  - Configuration: "${value}"
    Name: "value"
    Grafana:
      DashboardId: "value"
      Url: "value"
      Variables:
        - Key: "value"
          Value: "value"
    Kibana:
      DataViewId: "value"
      Url: "value"
      KqlQuery: "value"
      TimestampField: "@timestamp"
    Prometheus:
      Url: "value"
      Expressions:
        - "value"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
