# DeleteElasticIndices Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                       | Type                   | Required | Default | Description                                                                                                                                  |
| --------------------------------------------------- | ---------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                | `object or string`     | ✖        |         |                                                                                                                                              |
| `ProbeConfiguration.IndexPattern`                   | `string`               | ✔        |         | The index pattern of the relevant indices                                                                                                    |
| `ProbeConfiguration.Password`                       | `string`               | ✔        |         | The password of the elasticsearch                                                                                                            |
| `ProbeConfiguration.Url`                            | `string`               | ✔        |         | The url of the elasticsearch                                                                                                                 |
| `ProbeConfiguration.Username`                       | `string`               | ✔        |         | The username of the elasticsearch                                                                                                            |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | ✖        | `False` | Allow invalid TLS certificates when connecting to Elasticsearch over HTTPS.                                                                  |
| `ProbeConfiguration.RequestTimeoutMs`               | `integer or string`    | ✖        | `30000` | The timeout in milliseconds on the requests sent to the elastic                                                                              |
| `ProbeConfiguration.UseGlobalDict`                  | `string or true/false` | ✖        | `False` | When true, missing Elasticsearch probe configuration keys can be resolved from the shared global dictionary before local values are applied. |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteElasticIndices/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DeleteElasticIndices/overview/index.md)
