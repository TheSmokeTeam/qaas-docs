---
id: assertions.available.delaybychunks.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/DelayByChunks/overview.md]
code_langs: [yaml]
keywords: [assertions, DelayByChunks, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for DelayByChunks AssertionConfiguration — copy, fill the blanks, drop into a Session step."
tags: [assertions]
canonical_url: /assertions/availableAssertions/DelayByChunks/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# DelayByChunks — Configuration (YAML scaffold)

Drop this into the `AssertionConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
AssertionConfiguration:
  Output:
    Name:
    ChunkSize:
    ChunkTimeOption:
  Input:
    Name:
    ChunkSize:
    ChunkTimeOption:
  InputsAreOutputs:
  MaximumDelayMs:
  MaximumNegativeDelayBufferMs:
```
