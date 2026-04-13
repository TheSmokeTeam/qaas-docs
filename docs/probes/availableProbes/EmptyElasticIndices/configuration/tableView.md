# EmptyElasticIndices Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.IndexPattern` | `string` | &#10004 |  | The index pattern of the relevant indices |
| `ProbeConfiguration.Password` | `string` | &#10004 |  | The password of the elasticsearch |
| `ProbeConfiguration.Url` | `string` | &#10004 |  | The url of the elasticsearch |
| `ProbeConfiguration.Username` | `string` | &#10004 |  | The username of the elasticsearch |
| `ProbeConfiguration.MatchQueryString` | `string` | &#10006 | * | The match query string for the documents from the relevant indices |
| `ProbeConfiguration.RequestTimeoutMs` | `integer or string` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |
