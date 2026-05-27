---
id: assertions.available.httpstatus.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HttpStatus, yaml, scaffold]
summary: "Minimal YAML scaffold for HttpStatus AssertionConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# HttpStatus Configurations Yaml View

> TL;DR: Minimal YAML scaffold for HttpStatus AssertionConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
AssertionConfiguration:
  StatusCode: "${value}"
  OutputNames:
    - "value"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
