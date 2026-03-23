# EmptyElasticIndices Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.IndexPattern` | `String` | &#10004 |  | The index pattern of the relevant indices |
| `ProbeConfiguration.Password` | `String` | &#10004 |  | The password of the elasticsearch |
| `ProbeConfiguration.Url` | `String` | &#10004 |  | The url of the elasticsearch |
| `ProbeConfiguration.Username` | `String` | &#10004 |  | The username of the elasticsearch |
| `ProbeConfiguration.MatchQueryString` | `String` | &#10006 | * | The match query string for the documents from the relevant indices |
| `ProbeConfiguration.RequestTimeoutMs` | `Integer | String` | &#10006 | 30000 | The timeout in milliseconds on the requests sent to the elastic |
