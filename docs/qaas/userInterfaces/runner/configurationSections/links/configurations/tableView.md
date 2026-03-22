<!-- generated hash:be225cfcf418 sources:runner-family, Links, table-view -->

# Links Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Links` | `Array | Null | String` | &#10006 |  | The links generated on test results, used to view observability data outputted by the tested application. These links are generated per test result to be relevant specifically to that test and the time it ran at |
| `Links[]` | `Object | String` | &#10006 |  |  |
| `Links[].Name` | `Null | String` | &#10006 |  | The display name of the link in the test results, if none is given uses the `Type` as the name |
| `Links[].Grafana` | `Object | String` | &#10006 |  | Links the grafana dashboard filtered for the test's session times to each test result. |
| `Links[].Grafana.DashboardId` | `String` | &#10004 |  | The Id of the desired dashboard to view |
| `Links[].Grafana.Url` | `String` | &#10004 |  | The grafana's url, the base url without any route |
| `Links[].Grafana.Variables` | `Array | String` | &#10006 |  | The variables to display the dashboard with |
| `Links[].Grafana.Variables[]` | `Object | String` | &#10006 |  |  |
| `Links[].Grafana.Variables[].Key` | `String` | &#10006 |  |  |
| `Links[].Grafana.Variables[].Value` | `String` | &#10006 |  |  |
| `Links[].Kibana` | `Object | String` | &#10006 |  | Links the kibana's discovery filtered for the test's session times to each test result. |
| `Links[].Kibana.DataViewId` | `String` | &#10004 |  | The Id of the desired data view to view |
| `Links[].Kibana.Url` | `String` | &#10004 |  | The kibana's url, the base url without any route |
| `Links[].Kibana.KqlQuery` | `Null | String` | &#10006 |  | A custom Kql query to add to the generated URL, this query is added to the session time filtering query with `and`  |
| `Links[].Kibana.TimestampField` | `String` | &#10006 | @timestamp | The name of the main timestamp field to use to query on specific times in given data view |
| `Links[].Prometheus` | `Object | String` | &#10006 |  | Links the prometheus' graph filtered for the test's session times to each test result. |
| `Links[].Prometheus.Url` | `String` | &#10004 |  | The prometheus' url, the base url without any route |
| `Links[].Prometheus.Expressions` | `Array | String` | &#10006 | [<br />  ""<br />] | The expressions to generate prometheus panels for |
| `Links[].Prometheus.Expressions[]` | `String` | &#10006 |  |  |
