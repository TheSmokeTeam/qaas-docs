# TextTransformProcessor Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

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

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/TextTransformProcessor/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/TextTransformProcessor/overview/index.md)
