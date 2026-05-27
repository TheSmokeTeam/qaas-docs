---
id: assertions.available.hermeticbyexpectedoutputcount.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HermeticByExpectedOutputCount, configuration, reference]
summary: "Field-by-field reference for HermeticByExpectedOutputCount AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# HermeticByExpectedOutputCount Configurations Table View

> TL;DR: Field-by-field reference for HermeticByExpectedOutputCount AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to a given expected count. `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.ExpectedCount` | `integer or string` | &#10004 |  | The expected count of the items in the given output name in the given session |
| `AssertionConfiguration.OutputNames` | `list or string` | &#10004 |  | The names of the outputs to sum the counts of and then compare them to the expected count field in the given session |
| `AssertionConfiguration.OutputNames[]` | `string` | &#10006 |  |  |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
