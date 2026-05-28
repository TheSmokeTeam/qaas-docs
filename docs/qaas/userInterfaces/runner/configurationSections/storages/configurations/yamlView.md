---
id: qaas.userinterfaces.runner.configurationsections.storages.configurations.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, storages, configurations]
summary: "Storage configuration YAML example."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Storages Configurations Yaml View

> TL;DR: Storage configuration YAML example.

```yaml
Storages:
  - Configuration: "${value}"
    JsonStorageFormat: "Indented"
    FileSystem:
      Path: "value"
      SearchPattern: ""
    S3:
      AccessKey: "value"
      SecretKey: "value"
      ServiceURL: "value"
      StorageBucket: "value"
      Delimiter: ""
      ForcePathStyle: "${value}"
      MaximumRetryCount: "${value}"
      Prefix: ""
      SkipEmptyObjects: "${value}"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
