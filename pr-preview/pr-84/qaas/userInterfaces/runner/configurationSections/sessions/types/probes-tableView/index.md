# Probes Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                              | Type                       | Required | Default | Description                                                                                                                                     |
| ------------------------------------------ | -------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `Sessions[].Probes`                        | `list or string or null`   | ✖        |         | List of all probes to build and run for this session. Probes are hook methods that do not return data, and can be integrated inside session run |
| `Sessions[].Probes[]`                      | `object or string`         | ✖        |         |                                                                                                                                                 |
| `Sessions[].Probes[].Name`                 | `string`                   | ✔        |         | The name of the probe                                                                                                                           |
| `Sessions[].Probes[].Probe`                | `string`                   | ✔        |         | The name of the probe to use                                                                                                                    |
| `Sessions[].Probes[].ProbeConfiguration`   | `object or string or null` | ✖        |         | Implementation configuration for the probe, the configuration given here is loaded into the provided probe dynamically.                         |
| `Sessions[].Probes[].Stage`                | `integer or string`        | ✖        | 3       | The stage in which the Probe runs at                                                                                                            |
| `Sessions[].Probes[].DataSourceNames`      | `list or string`           | ✖        |         | Names of the pre defined data sources to pass to the probe                                                                                      |
| `Sessions[].Probes[].DataSourceNames[]`    | `string`                   | ✖        |         |                                                                                                                                                 |
| `Sessions[].Probes[].DataSourcePatterns`   | `list or string`           | ✖        |         | Regex patterns of data sources                                                                                                                  |
| `Sessions[].Probes[].DataSourcePatterns[]` | `string`                   | ✖        |         |                                                                                                                                                 |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/probes-yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
