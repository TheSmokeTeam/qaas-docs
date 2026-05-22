---
id: assertions.available.hermeticbyexpectedoutputcountinrange.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/HermeticByExpectedOutputCountInRange/overview.md]
code_langs: [yaml]
keywords: [assertions, HermeticByExpectedOutputCountInRange, configuration, reference]
ai_summary: "Field-by-field reference for HermeticByExpectedOutputCountInRange AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
tags: [assertions]
canonical_url: /assertions/availableAssertions/HermeticByExpectedOutputCountInRange/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# HermeticByExpectedOutputCountInRange — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.OutputNames` | `array or string` | &#10004 |  | The names of the outputs to sum the counts of and then compare them to the expected count field in the given session |
| `AssertionConfiguration.ExpectedMinimumCount` | `integer or string` | &#10004 |  | The expected minimum count of the items in the given output names in the given session |
| `AssertionConfiguration.ExpectedMaximumCount` | `integer or string` | &#10004 |  | The expected maximum count of the items in the given output names in the given session |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
