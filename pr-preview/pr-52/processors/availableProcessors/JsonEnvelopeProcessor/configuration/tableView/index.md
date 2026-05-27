# JsonEnvelopeProcessor Configurations Table View

> TL;DR: Field-by-field reference for JsonEnvelopeProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                                  | Type                       | Required | Default | Description                                                  |
| ---------------------------------------------- | -------------------------- | -------- | ------- | ------------------------------------------------------------ |
| `ProcessorConfiguration`                       | `object or string`         | ✖        |         |                                                              |
| `ProcessorConfiguration.BodyPropertyName`      | `string`                   | ✔        |         | Name of the JSON property that will contain the request body |
| `ProcessorConfiguration.ContentType`           | `string`                   | ✔        |         | Response Content-Type header                                 |
| `ProcessorConfiguration.StatusCode`            | `integer or string`        | ✔        |         | Response Status Code                                         |
| `ProcessorConfiguration.IncludeBodyType`       | `string or true/false`     | ✖        |         | Include the CLR body type as bodyType in the response        |
| `ProcessorConfiguration.IncludePathParameters` | `string or true/false`     | ✖        |         | Include path parameters as pathParameters in the response    |
| `ProcessorConfiguration.IncludeRequestHeaders` | `string or true/false`     | ✖        |         | Include request headers as requestHeaders in the response    |
| `ProcessorConfiguration.IncludeUri`            | `string or true/false`     | ✖        |         | Include the request URI as uri in the response               |
| `ProcessorConfiguration.ResponseHeaders`       | `object or string or null` | ✖        |         | Additional response headers                                  |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
