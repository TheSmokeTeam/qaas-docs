# MetaData Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path          | Type               | Required | Default | Description                        |
| ---------------------- | ------------------ | -------- | ------- | ---------------------------------- |
| `MetaData`             | `object or string` | ✖        |         | The metadata for the tests' run    |
| `MetaData.System`      | `string`           | ✔        |         | The tested system name             |
| `MetaData.Team`        | `string`           | ✔        |         | The team responsible for the tests |
| `MetaData.ExtraLabels` | `object or string` | ✖        |         | Extra labels added by the user     |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/metaData/configurations/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/metaData/overview/index.md)
