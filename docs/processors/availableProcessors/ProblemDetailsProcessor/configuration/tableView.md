# ProblemDetailsProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `String` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `Integer | String` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Title` | `String` | &#10004 |  | Problem details title |
| `ProcessorConfiguration.Type` | `String` | &#10004 |  | Problem details type |
| `ProcessorConfiguration.Detail` | `Null | String` | &#10006 |  | Problem details detail |
| `ProcessorConfiguration.Extensions` | `Null | Object | String` | &#10006 |  | Additional problem details extension fields |
| `ProcessorConfiguration.Instance` | `Null | String` | &#10006 |  | Explicit problem details instance |
| `ProcessorConfiguration.ResponseHeaders` | `Null | Object | String` | &#10006 |  | Additional response headers |
| `ProcessorConfiguration.UseRequestUriAsInstance` | `Boolean | String` | &#10006 |  | Use the request URI as the problem details instance when no explicit instance is configured |
