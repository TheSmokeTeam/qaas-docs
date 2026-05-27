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

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks that all configured output's http status code is equal to a certain number. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.StatusCode` | `integer or string` | &#10004 |  | The http status code all configured outputs should have |
| `AssertionConfiguration.OutputNames` | `list or string` | &#10004 |  | The names of the outputs to check the status code of |
| `AssertionConfiguration.OutputNames[]` | `string` | &#10006 |  |  |
