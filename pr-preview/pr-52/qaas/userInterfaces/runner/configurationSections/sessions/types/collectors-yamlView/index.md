# Collectors Configurations Yaml View

> TL;DR: Collector YAML scaffold for session metrics and time-range collection.

```yaml
Collectors:
  - Name: "value"
    Configuration: "${value}"
    EndTimeReachedCheckIntervalMs: "${value}"
    CollectionRange:
      EndTimeMs: "${value}"
      StartTimeMs: "${value}"
    DataFilter:
      Body: "${value}"
      MetaData: "${value}"
      Timestamp: "${value}"
    Prometheus:
      Expression: "value"
      Url: "value"
      ApiKey: "value"
      SampleIntervalMs: "${value}"
      TimeoutMs: "${value}"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
