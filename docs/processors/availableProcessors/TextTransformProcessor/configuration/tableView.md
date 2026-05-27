# TextTransformProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Prefix` | `string` | &#10006 |  | Text to prepend to the transformed payload |
| `ProcessorConfiguration.ReplacementText` | `string or null` | &#10006 |  | Replacement text for SearchText. Null removes the matched text. |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
| `ProcessorConfiguration.SearchText` | `string or null` | &#10006 |  | Optional text to search for in the incoming payload |
| `ProcessorConfiguration.Suffix` | `string` | &#10006 |  | Text to append to the transformed payload |
| `ProcessorConfiguration.TrimWhitespace` | `string or true/false` | &#10006 |  | Trim leading and trailing whitespace before applying prefix, suffix, and replacement |
