---
id: assertions.available.hermeticbyinputoutputpercentage.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HermeticByInputOutputPercentage, configuration, reference]
summary: "Field-by-field reference for HermeticByInputOutputPercentage AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# HermeticByInputOutputPercentage Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to a given percentage of the count of multiple inputs in a given session with certain names. `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.ExpectedPercentage` | `number or string` | &#10004 |  | The percentage of the sum of inputs count the outputs count should be equal to for the assertion to pass |
| `AssertionConfiguration.InputsAreOutputs` | `string or true/false` | &#10006 | `False` | Whether the given inputs in InputNames are actually another outputs list |
| `AssertionConfiguration.MidpointRounding` | `one of [ToEven / AwayFromZero / ToZero / ToNegativeInfinity / ToPositiveInfinity]` | &#10006 |  | Specifies the strategy the mathematical rounding method used for calculating the expected number of outputs (by taking a percentage of the sum of inputs) should use to round a number. Options: [ `AwayFromZero` - The strategy of rounding to the nearest number, and when a number is halfway between two others, it's rounded toward the nearest number that's away from zero / `ToEven` - The strategy of rounding to the nearest number, and when a number is halfway between two others, it's rounded toward the nearest even number / `ToZero` - The strategy of directed rounding toward zero, with the result closest to and no greater in magnitude than the infinitely precise result / `ToNegativeInfinity` - The strategy of downwards-directed rounding, with the result closest to and no greater than the infinitely precise result / `ToPositiveInfinity` - The strategy of upwards-directed rounding, with the result closest to and no less than the infinitely precise result ] |
| `AssertionConfiguration.InputNames` | `list or string` | &#10004 |  | The names of the inputs the sum of outputs should be a given percentage of the sum of |
| `AssertionConfiguration.InputNames[]` | `string` | &#10006 |  |  |
| `AssertionConfiguration.OutputNames` | `list or string` | &#10004 |  | The names of the outputs to sum the counts of  |
| `AssertionConfiguration.OutputNames[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
