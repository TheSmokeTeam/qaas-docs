# DeleteElasticIndices Configurations Table View

> TL;DR: Field-by-field reference for DeleteElasticIndices ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                                       | Type                   | Required | Default | Description                                                                                                                                  |
| --------------------------------------------------- | ---------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                | `object or string`     | ✖        |         |                                                                                                                                              |
| `ProbeConfiguration.IndexPattern`                   | `string`               | ✔        |         | The index pattern of the relevant indices                                                                                                    |
| `ProbeConfiguration.Password`                       | `string`               | ✔        |         | The password of the elasticsearch                                                                                                            |
| `ProbeConfiguration.Url`                            | `string`               | ✔        |         | The url of the elasticsearch                                                                                                                 |
| `ProbeConfiguration.Username`                       | `string`               | ✔        |         | The username of the elasticsearch                                                                                                            |
| `ProbeConfiguration.AllowInvalidServerCertificates` | `string or true/false` | ✖        | False   | Allow invalid TLS certificates when connecting to Elasticsearch over HTTPS.                                                                  |
| `ProbeConfiguration.RequestTimeoutMs`               | `integer or string`    | ✖        | 30000   | The timeout in milliseconds on the requests sent to the elastic                                                                              |
| `ProbeConfiguration.UseGlobalDict`                  | `string or true/false` | ✖        | False   | When true, missing Elasticsearch probe configuration keys can be resolved from the shared global dictionary before local values are applied. |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
