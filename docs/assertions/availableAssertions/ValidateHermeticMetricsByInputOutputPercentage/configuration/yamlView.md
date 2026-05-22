---
id: assertions.available.validatehermeticmetricsbyinputoutputpercentage.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, ValidateHermeticMetricsByInputOutputPercentage, yaml, scaffold]
summary: "Minimal YAML scaffold for ValidateHermeticMetricsByInputOutputPercentage AssertionConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# ValidateHermeticMetricsByInputOutputPercentage — Configuration (YAML scaffold)

Drop this into the `AssertionConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
AssertionConfiguration:
  OutputNames: []
  InputNames: []
  InputsAreOutputs:
  MetricOutputSourceName:
  Tolerance:
  InputMetricName:
  OutputMetricName:
  ProcessMetricName:
  CombineMetricName:
  FilteredMetricName:
  SplitMetricName:
```
