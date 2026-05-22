---
id: assertions.available.delaybyaverage.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, DelayByAverage, yaml, scaffold]
summary: "Minimal YAML scaffold for DelayByAverage AssertionConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# DelayByAverage — Configuration (YAML scaffold)

Drop this into the `AssertionConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
AssertionConfiguration:
  OutputName:
  InputName:
  InputsAreOutputs:
  MaximumDelayMs:
  MaximumNegativeDelayBufferMs:
```
