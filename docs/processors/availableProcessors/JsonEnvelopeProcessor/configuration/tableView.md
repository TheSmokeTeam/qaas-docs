---
id: processors.available.jsonenvelopeprocessor.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: [processors/availableProcessors/JsonEnvelopeProcessor/overview.md]
code_langs: [yaml]
keywords: [processors, JsonEnvelopeProcessor, configuration, reference]
ai_summary: "Field-by-field reference for JsonEnvelopeProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
tags: [processors]
canonical_url: /processors/availableProcessors/JsonEnvelopeProcessor/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json
---

# JsonEnvelopeProcessor — Configuration (table view)

Generated from `processors.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.BodyPropertyName` | `string` | &#10004 |  | Name of the JSON property that will contain the request body |
| `ProcessorConfiguration.IncludeBodyType` | `boolean or string` | &#10006 |  | Include the CLR body type as bodyType in the response |
| `ProcessorConfiguration.IncludeUri` | `boolean or string` | &#10006 |  | Include the request URI as uri in the response |
| `ProcessorConfiguration.IncludeRequestHeaders` | `boolean or string` | &#10006 |  | Include request headers as requestHeaders in the response |
| `ProcessorConfiguration.IncludePathParameters` | `boolean or string` | &#10006 |  | Include path parameters as pathParameters in the response |
| `ProcessorConfiguration.ResponseHeaders` | `null or object or string` | &#10006 |  | Additional response headers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
