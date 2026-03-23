<!-- generated hash:ec83fef1853a sources:mocker-family, ConditionalResponseProcessor, table-view -->

# ConditionalResponseProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.DefaultContentType` | `string` | &#10004 |  | Fallback response Content-Type header |
| `ProcessorConfiguration.DefaultStatusCode` | `integer or string` | &#10004 |  | Fallback response Status Code |
| `ProcessorConfiguration.DefaultBody` | `string or null` | &#10006 |  | Fallback response body when no rule matches |
| `ProcessorConfiguration.DefaultResponseHeaders` | `object or string or null` | &#10006 |  | Fallback response headers |
| `ProcessorConfiguration.Rules` | `list or string` | &#10004 |  | Rules evaluated in order. The first matching rule wins. |
| `ProcessorConfiguration.Rules[]` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.Rules[].ContentType` | `string` | &#10004 |  | Response Content-Type header when the rule matches |
| `ProcessorConfiguration.Rules[].ExpectedValue` | `string` | &#10004 |  | Expected value for the selected request header or path parameter |
| `ProcessorConfiguration.Rules[].StatusCode` | `integer or string` | &#10004 |  | Response Status Code when the rule matches |
| `ProcessorConfiguration.Rules[].PathParameterName` | `string or null` | &#10006 |  | Path parameter name to match |
| `ProcessorConfiguration.Rules[].RequestHeaderName` | `string or null` | &#10006 |  | Request header name to match |
| `ProcessorConfiguration.Rules[].ResponseBody` | `string or null` | &#10006 |  | Response body when the rule matches |
| `ProcessorConfiguration.Rules[].ResponseHeaders` | `object or string or null` | &#10006 |  | Response headers when the rule matches |
