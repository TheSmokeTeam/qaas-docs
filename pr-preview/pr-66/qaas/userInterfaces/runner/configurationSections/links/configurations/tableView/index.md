# Links Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                       | Type                     | Required | Default    | Description                                                                                                                                                                                                         |
| ----------------------------------- | ------------------------ | -------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Links`                             | `list or string or null` | ✖        |            | The links generated on test results, used to view observability data outputted by the tested application. These links are generated per test result to be relevant specifically to that test and the time it ran at |
| `Links[]`                           | `object or string`       | ✖        |            |                                                                                                                                                                                                                     |
| `Links[].Configuration`             | `object or string`       | ✖        |            |                                                                                                                                                                                                                     |
| `Links[].Name`                      | `string or null`         | ✖        |            | The display name of the link in the test results, if none is given uses the `Type` as the name                                                                                                                      |
| `Links[].Grafana`                   | `object or string`       | ✖        |            | Links the grafana dashboard filtered for the test's session times to each test result.                                                                                                                              |
| `Links[].Grafana.DashboardId`       | `string`                 | ✔        |            | The Id of the desired dashboard to view                                                                                                                                                                             |
| `Links[].Grafana.Url`               | `string`                 | ✔        |            | The grafana's url, the base url without any route                                                                                                                                                                   |
| `Links[].Grafana.Variables`         | `list or string`         | ✖        |            | The variables to display the dashboard with                                                                                                                                                                         |
| `Links[].Grafana.Variables[]`       | `object or string`       | ✖        |            |                                                                                                                                                                                                                     |
| `Links[].Grafana.Variables[].Key`   | `string`                 | ✔        |            |                                                                                                                                                                                                                     |
| `Links[].Grafana.Variables[].Value` | `string`                 | ✔        |            |                                                                                                                                                                                                                     |
| `Links[].Kibana`                    | `object or string`       | ✖        |            | Links the kibana's discovery filtered for the test's session times to each test result.                                                                                                                             |
| `Links[].Kibana.DataViewId`         | `string`                 | ✔        |            | The Id of the desired data view to view                                                                                                                                                                             |
| `Links[].Kibana.Url`                | `string`                 | ✔        |            | The kibana's url, the base url without any route                                                                                                                                                                    |
| `Links[].Kibana.KqlQuery`           | `string or null`         | ✖        |            | A custom Kql query to add to the generated URL, this query is added to the session time filtering query with `and`                                                                                                  |
| `Links[].Kibana.TimestampField`     | `string`                 | ✖        | @timestamp | The name of the main timestamp field to use to query on specific times in given data view                                                                                                                           |
| `Links[].Prometheus`                | `object or string`       | ✖        |            | Links the prometheus' graph filtered for the test's session times to each test result.                                                                                                                              |
| `Links[].Prometheus.Url`            | `string`                 | ✔        |            | The prometheus' url, the base url without any route                                                                                                                                                                 |
| `Links[].Prometheus.Expressions`    | `list or string`         | ✖        | [ "" ]     | The expressions to generate prometheus panels for                                                                                                                                                                   |
| `Links[].Prometheus.Expressions[]`  | `string`                 | ✖        |            |                                                                                                                                                                                                                     |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/configurations/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/overview/index.md)
