# DataSourceResponseProcessor Configurations Table View

> TL;DR: Field-by-field reference for DataSourceResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                            | Type                              | Required | Default | Description                                                                 |
| ---------------------------------------- | --------------------------------- | -------- | ------- | --------------------------------------------------------------------------- |
| `ProcessorConfiguration`                 | `object or string`                | ✖        |         |                                                                             |
| `ProcessorConfiguration.SelectionMode`   | `one of [First / Last / ByIndex]` | ✔        |         | Selection mode used to pick a generated item from the resolved data source  |
| `ProcessorConfiguration.StatusCode`      | `integer or string`               | ✔        |         | Response Status Code                                                        |
| `ProcessorConfiguration.ContentType`     | `string or null`                  | ✖        |         | Optional response Content-Type header                                       |
| `ProcessorConfiguration.DataSourceName`  | `string or null`                  | ✖        |         | Optional data source name. When omitted, the first data source is used.     |
| `ProcessorConfiguration.FallbackBody`    | `string or null`                  | ✖        |         | Fallback body to return when the data source cannot be resolved or selected |
| `ProcessorConfiguration.Index`           | `integer or string`               | ✖        |         | Zero-based item index used when SelectionMode is ByIndex                    |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null`        | ✖        |         | Additional response headers                                                 |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
