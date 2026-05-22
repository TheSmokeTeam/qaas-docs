---
id: assertions.available.hermeticbyexpectedoutputcount.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/HermeticByExpectedOutputCount/overview.md]
code_langs: [yaml]
keywords: [assertions, HermeticByExpectedOutputCount, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for HermeticByExpectedOutputCount AssertionConfiguration — copy, fill the blanks, drop into a Session step."
tags: [assertions]
canonical_url: /assertions/availableAssertions/HermeticByExpectedOutputCount/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# HermeticByExpectedOutputCount — Configuration (YAML scaffold)

Drop this into the `AssertionConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
AssertionConfiguration:
  OutputNames: []
  ExpectedCount:
```
