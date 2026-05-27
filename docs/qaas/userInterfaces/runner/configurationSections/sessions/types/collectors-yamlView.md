---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.collectors-yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Collector YAML scaffold for session metrics and time-range collection."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Collectors Configurations Yaml View

> TL;DR: Collector YAML scaffold for session metrics and time-range collection.

```yaml
Collectors:
  - Name:
    Configuration:
    EndTimeReachedCheckIntervalMs:
    CollectionRange:
      EndTimeMs:
      StartTimeMs:
    DataFilter:
      Body:
      MetaData:
      Timestamp:
    Prometheus:
      Expression:
      Url:
      ApiKey:
      SampleIntervalMs:
      TimeoutMs:
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
