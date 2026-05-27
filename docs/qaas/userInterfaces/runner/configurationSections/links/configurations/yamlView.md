---
id: qaas.userinterfaces.runner.configurationsections.links.configurations.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, links, configurations]
summary: "Link configuration YAML example."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
