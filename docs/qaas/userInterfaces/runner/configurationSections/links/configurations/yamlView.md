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

```yaml
Links:
  - Configuration:
    Name:
    Grafana:
      DashboardId:
      Url:
      Variables:
        - Key:
          Value:
    Kibana:
      DataViewId:
      Url:
      KqlQuery:
      TimestampField:
    Prometheus:
      Url:
      Expressions: []
```
