---
id: mocker.userinterfaces.mocker.configurationsections.datasources.configurations.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, datasources, configurations, yamlview]
summary: "Data source configuration YAML example."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->

# DataSources Configurations Yaml View

> TL;DR: Data source configuration YAML example.

```yaml
DataSources:
  - Generator: "FromCSV"
    Name: "value"
    GeneratorConfiguration: "${value}"
    Lazy: "${value}"
    DataSourceNames:
      - "value"
    DataSourcePatterns:
      - "value"
    Deserialize:
      Deserializer: "Binary"
      SpecificType:
        TypeFullName: "value"
        AssemblyName: "value"
    Serialize:
      Serializer: "Binary"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
