---
id: assertions.available.objectoutputjsonschema.overview
slug: objectoutputjsonschema
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [assertions, ObjectOutputJsonSchema, AssertionConfiguration]
ai_summary: "Validates that each configured output item matches at least one JSON schema provided by the configured data sources."
tags: [assertions]
canonical_url: /assertions/availableAssertions/ObjectOutputJsonSchema/overview/
# Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\SchemaLogic\ObjectOutputJsonSchema.cs
---

# ObjectOutputJsonSchema

Validates that each configured output item matches at least one JSON schema provided by the configured data sources.

## What it does

Validates that each configured output item matches at least one JSON schema provided by the configured data sources. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: ObjectOutputJsonSchemaSession
    Assertions:
      - Name: ObjectOutputJsonSchemaStep
        Assertion: ObjectOutputJsonSchema
        AssertionConfiguration:
        OutputName:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `ObjectOutputJsonSchema` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\SchemaLogic\ObjectOutputJsonSchema.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
