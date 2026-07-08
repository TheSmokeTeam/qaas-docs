# PassThroughProcessor Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                             | Type                       | Required | Default | Description                                                           |
| ----------------------------------------- | -------------------------- | -------- | ------- | --------------------------------------------------------------------- |
| `ProcessorConfiguration`                  | `object or string`         | ✖        |         |                                                                       |
| `ProcessorConfiguration.StatusCode`       | `integer or string`        | ✔        |         | Response Status Code                                                  |
| `ProcessorConfiguration.ContentType`      | `string or null`           | ✖        |         | Optional response Content-Type header                                 |
| `ProcessorConfiguration.PreserveMetaData` | `string or true/false`     | ✖        |         | Preserve request metadata and only replace the HTTP response metadata |
| `ProcessorConfiguration.ResponseHeaders`  | `object or string or null` | ✖        |         | Additional response headers                                           |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/PassThroughProcessor/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/PassThroughProcessor/overview/index.md)
