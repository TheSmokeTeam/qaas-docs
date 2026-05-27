# PassThroughProcessor Configurations Table View

> TL;DR: Field-by-field reference for PassThroughProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                             | Type                       | Required | Default | Description                                                           |
| ----------------------------------------- | -------------------------- | -------- | ------- | --------------------------------------------------------------------- |
| `ProcessorConfiguration`                  | `object or string`         | ✖        |         |                                                                       |
| `ProcessorConfiguration.StatusCode`       | `integer or string`        | ✔        |         | Response Status Code                                                  |
| `ProcessorConfiguration.ContentType`      | `string or null`           | ✖        |         | Optional response Content-Type header                                 |
| `ProcessorConfiguration.PreserveMetaData` | `string or true/false`     | ✖        |         | Preserve request metadata and only replace the HTTP response metadata |
| `ProcessorConfiguration.ResponseHeaders`  | `object or string or null` | ✖        |         | Additional response headers                                           |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
