# ProblemDetailsProcessor Configurations Table View

> TL;DR: Field-by-field reference for ProblemDetailsProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                                    | Type                       | Required | Default | Description                                                                                 |
| ------------------------------------------------ | -------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------- |
| `ProcessorConfiguration`                         | `object or string`         | ✖        |         |                                                                                             |
| `ProcessorConfiguration.ContentType`             | `string`                   | ✔        |         | Response Content-Type header                                                                |
| `ProcessorConfiguration.StatusCode`              | `integer or string`        | ✔        |         | Response Status Code                                                                        |
| `ProcessorConfiguration.Title`                   | `string`                   | ✔        |         | Problem details title                                                                       |
| `ProcessorConfiguration.Type`                    | `string`                   | ✔        |         | Problem details type                                                                        |
| `ProcessorConfiguration.Detail`                  | `string or null`           | ✖        |         | Problem details detail                                                                      |
| `ProcessorConfiguration.Extensions`              | `object or string or null` | ✖        |         | Additional problem details extension fields                                                 |
| `ProcessorConfiguration.Instance`                | `string or null`           | ✖        |         | Explicit problem details instance                                                           |
| `ProcessorConfiguration.ResponseHeaders`         | `object or string or null` | ✖        |         | Additional response headers                                                                 |
| `ProcessorConfiguration.UseRequestUriAsInstance` | `string or true/false`     | ✖        |         | Use the request URI as the problem details instance when no explicit instance is configured |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
