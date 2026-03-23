# TextTransformProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `String` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `Integer | String` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Prefix` | `String` | &#10006 |  | Text to prepend to the transformed payload |
| `ProcessorConfiguration.ReplacementText` | `Null | String` | &#10006 |  | Replacement text for SearchText. Null removes the matched text. |
| `ProcessorConfiguration.ResponseHeaders` | `Null | Object | String` | &#10006 |  | Additional response headers |
| `ProcessorConfiguration.SearchText` | `Null | String` | &#10006 |  | Optional text to search for in the incoming payload |
| `ProcessorConfiguration.Suffix` | `String` | &#10006 |  | Text to append to the transformed payload |
| `ProcessorConfiguration.TrimWhitespace` | `Boolean | String` | &#10006 |  | Trim leading and trailing whitespace before applying prefix, suffix, and replacement |
