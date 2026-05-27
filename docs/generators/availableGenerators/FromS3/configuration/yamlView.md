---
id: generators.available.froms3.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromS3, yaml, scaffold]
summary: "Minimal YAML scaffold for FromS3 GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# FromS3 Configurations Yaml View

> TL;DR: Minimal YAML scaffold for FromS3 GeneratorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
GeneratorConfiguration:
  Count: "${value}"
  DataArrangeOrder: "AsciiAsc"
  DataUuidRegexExpression: ".*"
  LoadMetadataFirst: "${value}"
  StorageMetaData: "FullPath"
  S3:
    AccessKey: "value"
    SecretKey: "value"
    ServiceURL: "value"
    StorageBucket: "value"
    Delimiter: ""
    ForcePathStyle: "${value}"
    Prefix: ""
    SkipEmptyObjects: "${value}"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
