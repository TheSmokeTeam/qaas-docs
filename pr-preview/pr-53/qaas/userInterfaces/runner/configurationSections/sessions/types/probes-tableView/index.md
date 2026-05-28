# Probes Configurations Table View

> TL;DR: Probes Configurations Table View

| Property Path                              | Type                       | Required | Default | Description                                                                                                                                     |
| ------------------------------------------ | -------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `Sessions[].Probes`                        | `list or string or null`   | ✖        |         | List of all probes to build and run for this session. Probes are hook methods that do not return data, and can be integrated inside session run |
| `Sessions[].Probes[]`                      | `object or string`         | ✖        |         |                                                                                                                                                 |
| `Sessions[].Probes[].Name`                 | `string`                   | ✔        |         | The name of the probe                                                                                                                           |
| `Sessions[].Probes[].Probe`                | `string`                   | ✔        |         | The name of the probe to use                                                                                                                    |
| `Sessions[].Probes[].Configuration`        | `object or string`         | ✖        |         |                                                                                                                                                 |
| `Sessions[].Probes[].ProbeConfiguration`   | `object or string or null` | ✖        |         | Implementation configuration for the probe, the configuration given here is loaded into the provided probe dynamically.                         |
| `Sessions[].Probes[].Stage`                | `integer or string`        | ✖        | 3       | The stage in which the Probe runs at                                                                                                            |
| `Sessions[].Probes[].DataSourceNames`      | `list or string`           | ✖        |         | Names of the pre defined data sources to pass to the probe                                                                                      |
| `Sessions[].Probes[].DataSourceNames[]`    | `string`                   | ✖        |         |                                                                                                                                                 |
| `Sessions[].Probes[].DataSourcePatterns`   | `list or string`           | ✖        |         | Regex patterns of data sources                                                                                                                  |
| `Sessions[].Probes[].DataSourcePatterns[]` | `string`                   | ✖        |         |                                                                                                                                                 |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
