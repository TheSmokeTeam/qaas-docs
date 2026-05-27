---
id: processors.available.conditionalresponseprocessor.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, ConditionalResponseProcessor, yaml, scaffold]
summary: "Minimal YAML scaffold for ConditionalResponseProcessor ProcessorConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# ConditionalResponseProcessor Configurations Yaml View

> TL;DR: Minimal YAML scaffold for ConditionalResponseProcessor ProcessorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
ProcessorConfiguration:
  DefaultContentType:
  DefaultStatusCode:
  DefaultBody:
  DefaultResponseHeaders:
  Rules:
    - ContentType:
      ExpectedValue:
      StatusCode:
      PathParameterName:
      RequestHeaderName:
      ResponseBody:
      ResponseHeaders:
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
