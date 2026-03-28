# Probes Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions[].Probes` | `list or string or null` | &#10006 |  | List of all probes to build and run for this session. Probes are hook methods that do not return data, and can be integrated inside session run |
| `Sessions[].Probes[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Probes[].Name` | `string` | &#10004 |  | The name of the probe |
| `Sessions[].Probes[].Probe` | `string` | &#10004 |  | The name of the probe to use |
| `Sessions[].Probes[].ProbeConfiguration` | `object or string or null` | &#10006 |  | Implementation configuration for the probe, the configuration given here is loaded into the provided probe dynamically. |
| `Sessions[].Probes[].Stage` | `integer or string` | &#10006 | 3 | The stage in which the Probe runs at |
| `Sessions[].Probes[].DataSourceNames` | `list or string` | &#10006 |  | Names of the pre defined data sources to pass to the probe |
| `Sessions[].Probes[].DataSourceNames[]` | `string` | &#10006 |  |  |
| `Sessions[].Probes[].DataSourcePatterns` | `list or string` | &#10006 |  | Regex patterns of data sources |
| `Sessions[].Probes[].DataSourcePatterns[]` | `string` | &#10006 |  |  |
