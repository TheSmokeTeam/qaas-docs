# Links Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Links` | `list or string or null` | &#10006 |  | The links generated on test results, used to view observability data outputted by the tested application. These links are generated per test result to be relevant specifically to that test and the time it ran at |
| `Links[]` | `object or string` | &#10006 |  |  |
| `Links[].Configuration` | `object or string` | &#10006 |  |  |
| `Links[].Name` | `string or null` | &#10006 |  | The display name of the link in the test results, if none is given uses the `Type` as the name |
| `Links[].Grafana` | `object or string` | &#10006 |  | Links the grafana dashboard filtered for the test's session times to each test result. |
| `Links[].Grafana.DashboardId` | `string` | &#10004 |  | The Id of the desired dashboard to view |
| `Links[].Grafana.Url` | `string` | &#10004 |  | The grafana's url, the base url without any route |
| `Links[].Grafana.Variables` | `list or string` | &#10006 |  | The variables to display the dashboard with |
| `Links[].Grafana.Variables[]` | `object or string` | &#10006 |  |  |
| `Links[].Grafana.Variables[].Key` | `string` | &#10006 |  |  |
| `Links[].Grafana.Variables[].Value` | `string` | &#10006 |  |  |
| `Links[].Kibana` | `object or string` | &#10006 |  | Links the kibana's discovery filtered for the test's session times to each test result. |
| `Links[].Kibana.DataViewId` | `string` | &#10004 |  | The Id of the desired data view to view |
| `Links[].Kibana.Url` | `string` | &#10004 |  | The kibana's url, the base url without any route |
| `Links[].Kibana.KqlQuery` | `string or null` | &#10006 |  | A custom Kql query to add to the generated URL, this query is added to the session time filtering query with `and`  |
| `Links[].Kibana.TimestampField` | `string` | &#10006 | @timestamp | The name of the main timestamp field to use to query on specific times in given data view |
| `Links[].Prometheus` | `object or string` | &#10006 |  | Links the prometheus' graph filtered for the test's session times to each test result. |
| `Links[].Prometheus.Url` | `string` | &#10004 |  | The prometheus' url, the base url without any route |
| `Links[].Prometheus.Expressions` | `list or string` | &#10006 | [<br />  ""<br />] | The expressions to generate prometheus panels for |
| `Links[].Prometheus.Expressions[]` | `string` | &#10006 |  |  |
