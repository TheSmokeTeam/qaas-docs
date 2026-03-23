# ConditionalResponseProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.DefaultContentType` | `String` | &#10004 |  | Fallback response Content-Type header |
| `ProcessorConfiguration.DefaultStatusCode` | `Integer | String` | &#10004 |  | Fallback response Status Code |
| `ProcessorConfiguration.DefaultBody` | `Null | String` | &#10006 |  | Fallback response body when no rule matches |
| `ProcessorConfiguration.DefaultResponseHeaders` | `Null | Object | String` | &#10006 |  | Fallback response headers |
| `ProcessorConfiguration.Rules` | `Array | String` | &#10004 |  | Rules evaluated in order. The first matching rule wins. |
| `ProcessorConfiguration.Rules[]` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.Rules[].ContentType` | `String` | &#10004 |  | Response Content-Type header when the rule matches |
| `ProcessorConfiguration.Rules[].ExpectedValue` | `String` | &#10004 |  | Expected value for the selected request header or path parameter |
| `ProcessorConfiguration.Rules[].StatusCode` | `Integer | String` | &#10004 |  | Response Status Code when the rule matches |
| `ProcessorConfiguration.Rules[].PathParameterName` | `Null | String` | &#10006 |  | Path parameter name to match |
| `ProcessorConfiguration.Rules[].RequestHeaderName` | `Null | String` | &#10006 |  | Request header name to match |
| `ProcessorConfiguration.Rules[].ResponseBody` | `Null | String` | &#10006 |  | Response body when the rule matches |
| `ProcessorConfiguration.Rules[].ResponseHeaders` | `Null | Object | String` | &#10006 |  | Response headers when the rule matches |
