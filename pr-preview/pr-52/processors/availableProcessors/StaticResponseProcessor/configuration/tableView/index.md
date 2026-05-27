# StaticResponseProcessor Configurations Table View

> TL;DR: Field-by-field reference for StaticResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                            | Type                       | Required | Default | Description                           |
| ---------------------------------------- | -------------------------- | -------- | ------- | ------------------------------------- |
| `ProcessorConfiguration`                 | `object or string`         | ✖        |         |                                       |
| `ProcessorConfiguration.ContentType`     | `string`                   | ✔        |         | Response Content-Type header          |
| `ProcessorConfiguration.StatusCode`      | `integer or string`        | ✔        |         | Response Status Code                  |
| `ProcessorConfiguration.Body`            | `string or null`           | ✖        |         | Response body to return as UTF-8 text |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | ✖        |         | Additional response headers           |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
