---
id: qaas.userinterfaces.runner.configurationsections.assertions.configurations.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, assertions, configurations]
summary: "Assertion configuration YAML example."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Assertions Configurations Yaml View

> TL;DR: Assertion configuration YAML example.

```yaml
Assertions:
  - Assertion:
    Name:
    AssertionConfiguration:
    Category:
    Configuration:
    DisplayTrace:
    SaveAttachments:
    SaveLogs:
    SaveSessionData:
    SaveTemplate:
    Severity:
    DataSourceNames: []
    DataSourcePatterns: []
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
    SessionNamePatterns: []
    SessionNames: []
    StatusesToReport: []
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
