# ConditionalResponseProcessor Configurations Table View

> TL;DR: Field-by-field reference for ConditionalResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                                      | Type                       | Required | Default | Description                                                      |
| -------------------------------------------------- | -------------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `ProcessorConfiguration`                           | `object or string`         | ✖        |         |                                                                  |
| `ProcessorConfiguration.DefaultContentType`        | `string`                   | ✔        |         | Fallback response Content-Type header                            |
| `ProcessorConfiguration.DefaultStatusCode`         | `integer or string`        | ✔        |         | Fallback response Status Code                                    |
| `ProcessorConfiguration.DefaultBody`               | `string or null`           | ✖        |         | Fallback response body when no rule matches                      |
| `ProcessorConfiguration.DefaultResponseHeaders`    | `object or string or null` | ✖        |         | Fallback response headers                                        |
| `ProcessorConfiguration.Rules`                     | `list or string`           | ✔        |         | Rules evaluated in order. The first matching rule wins.          |
| `ProcessorConfiguration.Rules[]`                   | `object or string`         | ✖        |         |                                                                  |
| `ProcessorConfiguration.Rules[].ContentType`       | `string`                   | ✔        |         | Response Content-Type header when the rule matches               |
| `ProcessorConfiguration.Rules[].ExpectedValue`     | `string`                   | ✔        |         | Expected value for the selected request header or path parameter |
| `ProcessorConfiguration.Rules[].StatusCode`        | `integer or string`        | ✔        |         | Response Status Code when the rule matches                       |
| `ProcessorConfiguration.Rules[].PathParameterName` | `string or null`           | ✖        |         | Path parameter name to match                                     |
| `ProcessorConfiguration.Rules[].RequestHeaderName` | `string or null`           | ✖        |         | Request header name to match                                     |
| `ProcessorConfiguration.Rules[].ResponseBody`      | `string or null`           | ✖        |         | Response body when the rule matches                              |
| `ProcessorConfiguration.Rules[].ResponseHeaders`   | `object or string or null` | ✖        |         | Response headers when the rule matches                           |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
