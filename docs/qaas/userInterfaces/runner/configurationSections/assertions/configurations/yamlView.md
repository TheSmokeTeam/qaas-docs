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
  - Assertion: "DelayByAverage"
    Name: "value"
    AssertionConfiguration: "${value}"
    Category: "value"
    Configuration: "${value}"
    DisplayTrace: "${value}"
    SaveAttachments: "${value}"
    SaveLogs: "${value}"
    SaveSessionData: "${value}"
    SaveTemplate: "${value}"
    Severity: "Trivial"
    DataSourceNames:
      - "value"
    DataSourcePatterns:
      - "value"
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
    SessionNamePatterns:
      - "value"
    SessionNames:
      - "value"
    StatusesToReport:
      - "Passed"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
