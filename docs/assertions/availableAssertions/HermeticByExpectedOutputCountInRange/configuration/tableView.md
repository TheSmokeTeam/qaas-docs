---
id: assertions.available.hermeticbyexpectedoutputcountinrange.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HermeticByExpectedOutputCountInRange, configuration, reference]
summary: "Field-by-field reference for HermeticByExpectedOutputCountInRange AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# HermeticByExpectedOutputCountInRange Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to be between a given expected maximum limit and minimum limit. `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.ExpectedMaximumCount` | `integer or string` | &#10004 |  | The expected maximum count of the items in the given output names in the given session |
| `AssertionConfiguration.ExpectedMinimumCount` | `integer or string` | &#10004 |  | The expected minimum count of the items in the given output names in the given session |
| `AssertionConfiguration.OutputNames` | `list or string` | &#10004 |  | The names of the outputs to sum the counts of and then compare them to the expected count field in the given session |
| `AssertionConfiguration.OutputNames[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
