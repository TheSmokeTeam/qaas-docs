---
id: assertions.available.delaybyaverage.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/DelayByAverage/overview.md]
code_langs: [yaml]
keywords: [assertions, DelayByAverage, configuration, reference]
ai_summary: "Field-by-field reference for DelayByAverage AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
tags: [assertions]
canonical_url: /assertions/availableAssertions/DelayByAverage/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# DelayByAverage — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.OutputName` | `string` | &#10004 |  | Name of the output end point to check the outputs of |
| `AssertionConfiguration.InputName` | `string` | &#10004 |  | Name of the input end point to check the inputs of |
| `AssertionConfiguration.InputsAreOutputs` | `boolean or string` | &#10006 | false | Whether the given input in InputName is actually another outputs list |
| `AssertionConfiguration.MaximumDelayMs` | `integer or string` | &#10004 |  | maximum delay in milliseconds allowed for average delay for assertion to pass |
| `AssertionConfiguration.MaximumNegativeDelayBufferMs` | `integer or null or string` | &#10006 | 100 | maximum negative delay buffer of average delay in milliseconds, if value falls within the buffer it is still compared to maximum allowed delay |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
