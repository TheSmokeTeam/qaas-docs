# ConditionalResponseProcessor Configurations Yaml View

> TL;DR: Minimal YAML scaffold for ConditionalResponseProcessor ProcessorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
ProcessorConfiguration:
  DefaultContentType: "value"
  DefaultStatusCode: "${value}"
  DefaultBody: "value"
  DefaultResponseHeaders: "${value}"
  Rules:
    - ContentType: "value"
      ExpectedValue: "value"
      StatusCode: "${value}"
      PathParameterName: "value"
      RequestHeaderName: "value"
      ResponseBody: "value"
      ResponseHeaders: "${value}"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
