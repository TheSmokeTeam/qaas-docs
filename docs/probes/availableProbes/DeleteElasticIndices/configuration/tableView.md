# DeleteElasticIndices Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.IndexPattern` | `string` | &#10004 |  | The index pattern of the relevant indices |
| `ProbeConfiguration.Password` | `string` | &#10004 |  | The password of the elasticsearch |
| `ProbeConfiguration.Url` | `string` | &#10004 |  | The url of the elasticsearch |
| `ProbeConfiguration.Username` | `string` | &#10004 |  | The username of the elasticsearch |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing Elasticsearch probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
