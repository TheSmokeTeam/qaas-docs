---
id: assertions.available.validatehermeticmetricsbyinputoutputpercentage.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/ValidateHermeticMetricsByInputOutputPercentage/overview.md]
code_langs: [yaml]
keywords: [assertions, ValidateHermeticMetricsByInputOutputPercentage, configuration, reference]
ai_summary: "Field-by-field reference for ValidateHermeticMetricsByInputOutputPercentage AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
tags: [assertions]
canonical_url: /assertions/availableAssertions/ValidateHermeticMetricsByInputOutputPercentage/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# ValidateHermeticMetricsByInputOutputPercentage — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.OutputNames` | `array or string` | &#10004 |  | The names of the outputs to sum the counts of |
| `AssertionConfiguration.InputNames` | `array or string` | &#10004 |  | The names of the inputs the sum of outputs should be a given percentage of the sum of |
| `AssertionConfiguration.InputsAreOutputs` | `boolean or string` | &#10006 | false | Whether the given inputs in InputNames are actually another outputs list |
| `AssertionConfiguration.MetricOutputSourceName` | `string` | &#10004 |  | The name of the output to take the metrics from |
| `AssertionConfiguration.Tolerance` | `number or string` | &#10006 | 0.01 | The tolerance of difference between metrics` hermetics percantage and outputs' count to inputs' count hermetics percentage |
| `AssertionConfiguration.InputMetricName` | `string` | &#10004 |  | The name of the input metric of the metric hemetrics formula |
| `AssertionConfiguration.OutputMetricName` | `string` | &#10004 |  | The name of the output metric of the metric hemetrics formula |
| `AssertionConfiguration.ProcessMetricName` | `null or string` | &#10006 |  | The name of the process metric of the metric hemetrics formula |
| `AssertionConfiguration.CombineMetricName` | `null or string` | &#10006 |  | The name of the combine metric of the metric hemetrics formula |
| `AssertionConfiguration.FilteredMetricName` | `null or string` | &#10006 |  | The name of the filtered metric of the metric hemetrics formula |
| `AssertionConfiguration.SplitMetricName` | `null or string` | &#10006 |  | The name of the split metric of the metric hemetrics formula |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
