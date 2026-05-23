---
id: assertions.available.httpstatus.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HttpStatus, configuration, reference]
summary: "Field-by-field reference for HttpStatus AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# HttpStatus Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks that all configured output's http status code is equal to a certain number. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.StatusCode` | `integer or string` | &#10004 |  | The http status code all configured outputs should have |
| `AssertionConfiguration.OutputNames` | `list or string` | &#10004 |  | The names of the outputs to check the status code of |
| `AssertionConfiguration.OutputNames[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
