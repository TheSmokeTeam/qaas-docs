---
id: assertions.available.delaybyaverage.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, DelayByAverage, configuration, reference]
summary: "Field-by-field reference for DelayByAverage AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# DelayByAverage Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Delay checks the time interval between the inputs and outputs is not bigger than a configured number by subtracting the average timestamp of all inputs from the average timestamp of all the outputs. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.InputName` | `string` | &#10004 |  | Name of the input end point to check the inputs of |
| `AssertionConfiguration.MaximumDelayMs` | `integer or string` | &#10004 |  | maximum delay in milliseconds allowed for average delay for assertion to pass |
| `AssertionConfiguration.OutputName` | `string` | &#10004 |  | Name of the output end point to check the outputs of |
| `AssertionConfiguration.InputsAreOutputs` | `string or true/false` | &#10006 | `False` | Whether the given input in InputName is actually another outputs list |
| `AssertionConfiguration.MaximumNegativeDelayBufferMs` | `integer or string or null` | &#10006 | `100` | maximum negative delay buffer of average delay in milliseconds, if value falls within the buffer it is still compared to maximum allowed delay |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
