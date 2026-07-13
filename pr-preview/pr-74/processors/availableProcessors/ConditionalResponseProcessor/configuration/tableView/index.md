# ConditionalResponseProcessor Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                      | Type                       | Required | Default | Description                                                      |
| -------------------------------------------------- | -------------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `ProcessorConfiguration`                           | `object or string`         | ✖        |         |                                                                  |
| `ProcessorConfiguration.DefaultContentType`        | `string`                   | ✔        |         | Fallback response Content-Type header                            |
| `ProcessorConfiguration.DefaultStatusCode`         | `integer or string`        | ✔        |         | Fallback response Status Code                                    |
| `ProcessorConfiguration.DefaultBody`               | `string or null`           | ✖        |         | Fallback response body when no rule matches                      |
| `ProcessorConfiguration.DefaultResponseHeaders`    | `object or string or null` | ✖        |         | Fallback response headers                                        |
| `ProcessorConfiguration.Rules`                     | `list or string`           | ✔        |         | Rules evaluated in order. The first matching rule wins.          |
| `ProcessorConfiguration.Rules[]`                   | `object or string`         | ✖        |         |                                                                  |
| `ProcessorConfiguration.Rules[].ContentType`       | `string`                   | ✔        |         | Response Content-Type header when the rule matches               |
| `ProcessorConfiguration.Rules[].ExpectedValue`     | `string`                   | ✔        |         | Expected value for the selected request header or path parameter |
| `ProcessorConfiguration.Rules[].StatusCode`        | `integer or string`        | ✔        |         | Response Status Code when the rule matches                       |
| `ProcessorConfiguration.Rules[].PathParameterName` | `string or null`           | ✖        |         | Path parameter name to match                                     |
| `ProcessorConfiguration.Rules[].RequestHeaderName` | `string or null`           | ✖        |         | Request header name to match                                     |
| `ProcessorConfiguration.Rules[].ResponseBody`      | `string or null`           | ✖        |         | Response body when the rule matches                              |
| `ProcessorConfiguration.Rules[].ResponseHeaders`   | `object or string or null` | ✖        |         | Response headers when the rule matches                           |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/ConditionalResponseProcessor/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/ConditionalResponseProcessor/overview/index.md)
