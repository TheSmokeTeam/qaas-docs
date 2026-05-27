# TextTransformProcessor Configurations Table View

> TL;DR: Field-by-field reference for TextTransformProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path                            | Type                       | Required | Default | Description                                                                          |
| ---------------------------------------- | -------------------------- | -------- | ------- | ------------------------------------------------------------------------------------ |
| `ProcessorConfiguration`                 | `object or string`         | ✖        |         |                                                                                      |
| `ProcessorConfiguration.ContentType`     | `string`                   | ✔        |         | Response Content-Type header                                                         |
| `ProcessorConfiguration.StatusCode`      | `integer or string`        | ✔        |         | Response Status Code                                                                 |
| `ProcessorConfiguration.Prefix`          | `string`                   | ✖        |         | Text to prepend to the transformed payload                                           |
| `ProcessorConfiguration.ReplacementText` | `string or null`           | ✖        |         | Replacement text for SearchText. Null removes the matched text.                      |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | ✖        |         | Additional response headers                                                          |
| `ProcessorConfiguration.SearchText`      | `string or null`           | ✖        |         | Optional text to search for in the incoming payload                                  |
| `ProcessorConfiguration.Suffix`          | `string`                   | ✖        |         | Text to append to the transformed payload                                            |
| `ProcessorConfiguration.TrimWhitespace`  | `string or true/false`     | ✖        |         | Trim leading and trailing whitespace before applying prefix, suffix, and replacement |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
