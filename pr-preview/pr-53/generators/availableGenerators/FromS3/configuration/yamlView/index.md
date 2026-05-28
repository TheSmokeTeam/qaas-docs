# FromS3 Configurations Yaml View

> TL;DR: Minimal YAML scaffold for FromS3 GeneratorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
