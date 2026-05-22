---
id: probes.available.emptyelasticindices.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, EmptyElasticIndices, configuration, reference]
summary: "Field-by-field reference for EmptyElasticIndices ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# EmptyElasticIndices — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.MatchQueryString` | `string` | &#10006 | * | The match query string for the documents from the relevant indices |
| `ProbeConfiguration.IndexPattern` | `string` | &#10004 |  | The index pattern of the relevant indices |
| `ProbeConfiguration.Url` | `string` | &#10004 |  | The url of the elasticsearch |
| `ProbeConfiguration.Username` | `string` | &#10004 |  | The username of the elasticsearch |
| `ProbeConfiguration.Password` | `string` | &#10004 |  | The password of the elasticsearch |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
