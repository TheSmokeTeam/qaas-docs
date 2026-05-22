---
id: assertions.available.hermeticbyinputoutputpercentageinrange.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/HermeticByInputOutputPercentageInRange/overview.md]
code_langs: [yaml]
keywords: [assertions, HermeticByInputOutputPercentageInRange, configuration, reference]
ai_summary: "Field-by-field reference for HermeticByInputOutputPercentageInRange AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
tags: [assertions]
canonical_url: /assertions/availableAssertions/HermeticByInputOutputPercentageInRange/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# HermeticByInputOutputPercentageInRange — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.OutputNames` | `array or string` | &#10004 |  | The names of the outputs to sum the counts of |
| `AssertionConfiguration.InputNames` | `array or string` | &#10004 |  | The names of the inputs the sum of outputs should be a given percentage of the sum of |
| `AssertionConfiguration.ExpectedMinimumPercentage` | `number or string` | &#10004 |  | The minimum percentage limit of the sum of inputs count to the outputs count, should be above the minimum to for the assertion to pass |
| `AssertionConfiguration.ExpectedMaximumPercentage` | `number or string` | &#10004 |  | The maximum percentage limit of the sum of inputs count to the outputs count, should be below the maximum to for the assertion to pass |
| `AssertionConfiguration.InputsAreOutputs` | `boolean or string` | &#10006 | false | Whether the given inputs in InputNames are actually another outputs list |
| `AssertionConfiguration.MidpointRounding` | `integer or string` | &#10006 | AwayFromZero | Specifies the strategy the mathematical rounding method used for calculating the expected number of outputs (by taking a percentage of the sum of inputs) should use to round a number. Options: [ `AwayFromZero` - The strategy of rounding to the nearest number, and when a number is halfway between two others, it's rounded toward the nearest number that's away from zero / `ToEven` - The strategy of rounding to the nearest number, and when a number is halfway between two others, it's rounded toward the nearest even number / `ToZero` - The strategy of directed rounding toward zero, with the result closest to and no greater in magnitude than the infinitely precise result / `ToNegativeInfinity` - The strategy of downwards-directed rounding, with the result closest to and no greater than the infinitely precise result / `ToPositiveInfinity` - The strategy of upwards-directed rounding, with the result closest to and no less than the infinitely precise result ] |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
