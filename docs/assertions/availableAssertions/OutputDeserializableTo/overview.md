---
id: assertions.available.outputdeserializableto.overview
slug: outputdeserializableto
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [assertions, OutputDeserializableTo, AssertionConfiguration]
ai_summary: "Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer"
tags: [assertions]
canonical_url: /assertions/availableAssertions/OutputDeserializableTo/overview/
# Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\DeserializationLogic\OutputDeserializableTo.cs
---

# OutputDeserializableTo

Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer

## What it does

Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OutputDeserializableToSession
    Assertions:
      - Name: OutputDeserializableToStep
        Assertion: OutputDeserializableTo
        AssertionConfiguration:
        OutputName:
        Deserialize:
          Deserializer:
          SpecificType:
            AssemblyName:
            TypeFullName:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `OutputDeserializableTo` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\DeserializationLogic\OutputDeserializableTo.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
