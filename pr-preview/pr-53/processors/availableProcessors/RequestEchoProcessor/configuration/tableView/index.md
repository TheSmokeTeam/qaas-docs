# RequestEchoProcessor Configurations Table View

> TL;DR: Field-by-field reference for RequestEchoProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                                  | Type                       | Required | Default | Description                                                 |
| ---------------------------------------------- | -------------------------- | -------- | ------- | ----------------------------------------------------------- |
| `ProcessorConfiguration`                       | `object or string`         | ✖        |         |                                                             |
| `ProcessorConfiguration.ContentType`           | `string`                   | ✔        |         | Response Content-Type header                                |
| `ProcessorConfiguration.StatusCode`            | `integer or string`        | ✔        |         | Response Status Code                                        |
| `ProcessorConfiguration.IncludePathParameters` | `string or true/false`     | ✖        |         | Include request path parameters in the echoed JSON response |
| `ProcessorConfiguration.IncludeRequestHeaders` | `string or true/false`     | ✖        |         | Include request headers in the echoed JSON response         |
| `ProcessorConfiguration.IncludeUri`            | `string or true/false`     | ✖        |         | Include request Uri in the echoed JSON response             |
| `ProcessorConfiguration.ResponseHeaders`       | `object or string or null` | ✖        |         | Additional response headers                                 |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
