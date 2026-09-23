# JsonEnvelopeProcessor Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

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

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/JsonEnvelopeProcessor/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/JsonEnvelopeProcessor/overview/index.md)
