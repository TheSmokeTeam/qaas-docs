---
id: probes.available.deleteelasticindices.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteElasticIndices, configuration, reference]
summary: "Field-by-field reference for DeleteElasticIndices ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# DeleteElasticIndices Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.IndexPattern` | `string` | &#10004 |  | The index pattern of the relevant indices |
| `ProbeConfiguration.Password` | `string` | &#10004 |  | The password of the elasticsearch |
| `ProbeConfiguration.Url` | `string` | &#10004 |  | The url of the elasticsearch |
| `ProbeConfiguration.Username` | `string` | &#10004 |  | The username of the elasticsearch |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | `False` | Allow invalid TLS certificates when connecting to Elasticsearch over HTTPS. |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | `30000` | The timeout in milliseconds on the requests sent to the elastic |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | `False` | When true, missing Elasticsearch probe configuration keys can be resolved from the shared global dictionary before local values are applied. |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
