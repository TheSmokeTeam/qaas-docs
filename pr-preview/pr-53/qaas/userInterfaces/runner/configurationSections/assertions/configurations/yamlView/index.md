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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
