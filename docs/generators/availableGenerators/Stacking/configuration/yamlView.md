---
id: generators.available.stacking.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, Stacking, yaml, scaffold]
summary: "Minimal YAML scaffold for Stacking GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# Stacking Configurations Yaml View

> TL;DR: Minimal YAML scaffold for Stacking GeneratorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
GeneratorConfiguration:
  Count: "${value}"
  LoopFinishedGenerators: "${value}"
  ItemsPerGenerator:
    - "${value}"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
