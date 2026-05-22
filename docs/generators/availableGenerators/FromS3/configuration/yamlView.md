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

# FromS3 — Configuration (YAML scaffold)

Drop this into the `GeneratorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
GeneratorConfiguration:
  DataArrangeOrder:
  Count:
  DataUuidRegexExpression:
  StorageMetaData:
  LoadMetadataFirst:
  S3:
    StorageBucket:
    ServiceURL:
    AccessKey:
    SecretKey:
    ForcePathStyle:
    Delimiter:
    Prefix:
    SkipEmptyObjects:
```
