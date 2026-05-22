---
id: assertions.available.httpstatus.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: [assertions/availableAssertions/HttpStatus/overview.md]
code_langs: [yaml]
keywords: [assertions, HttpStatus, configuration, reference]
ai_summary: "Field-by-field reference for HttpStatus AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
tags: [assertions]
canonical_url: /assertions/availableAssertions/HttpStatus/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json
---

# HttpStatus — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.StatusCode` | `integer or string` | &#10004 |  | The http status code all configured outputs should have |
| `AssertionConfiguration.OutputNames` | `array or string` | &#10004 |  | The names of the outputs to check the status code of |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
