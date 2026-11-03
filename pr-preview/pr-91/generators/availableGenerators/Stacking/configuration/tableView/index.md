# Stacking Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                   | Type                        | Required | Default | Description                                                                                                                                                                                                                 |
| ----------------------------------------------- | --------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `GeneratorConfiguration`                        | `object or string`          | ✖        |         | Supports generating data from multiple DataSources by configured items per generator. `DataSources`: Used. `SessionData`: Passed to used DataSources.                                                                       |
| `GeneratorConfiguration.Count`                  | `integer or string or null` | ✖        |         | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.LoopFinishedGenerators` | `string or true/false`      | ✖        | `False` | When true, generators will restart when there are no more items in them                                                                                                                                                     |
| `GeneratorConfiguration.ItemsPerGenerator`      | `list or string`            | ✔        |         | The number of items to generate out of the given data sources in turn                                                                                                                                                       |
| `GeneratorConfiguration.ItemsPerGenerator[]`    | `integer or string`         | ✖        |         |                                                                                                                                                                                                                             |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/Stacking/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/Stacking/overview/index.md)
