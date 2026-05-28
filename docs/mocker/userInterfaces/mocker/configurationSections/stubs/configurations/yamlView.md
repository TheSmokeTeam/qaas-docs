---
id: mocker.userinterfaces.mocker.configurationsections.stubs.configurations.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, stubs, configurations, yamlview]
summary: "Stub configuration YAML example."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->

# Stubs Configurations Yaml View

> TL;DR: Stub configuration YAML example.

```yaml
Stubs:
  - Name: "value"
    Processor: "ConditionalResponseProcessor"
    ProcessorConfiguration: "${value}"
    DataSourceNames:
      - "value"
    RequestBodyDeserialization:
      Deserializer: "Binary"
      SpecificType:
        TypeFullName: "value"
        AssemblyName: "value"
    ResponseBodySerialization:
      Serializer: "Binary"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
