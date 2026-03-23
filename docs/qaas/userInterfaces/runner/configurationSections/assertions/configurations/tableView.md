<!-- generated hash:cd14c33c2ba7 sources:runner-family, Assertions, table-view -->

# Assertions Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Assertions` | `list or string or null` | &#10006 |  | The list of assertions performed on the sessions' results in order to decide the test's status, each assertion produces a different test result. |
| `Assertions[]` | `object or string` | &#10006 |  |  |
| `Assertions[].Assertion` | `string` | &#10004 |  | The name of the assertion to use |
| `Assertions[].Name` | `string` | &#10004 |  | The name of the test as presented in the test report with this assertion's result, if none is given creates a name as the type of the assertion and guid |
| `Assertions[].AssertionConfiguration` | `object or string or null` | &#10006 |  | Implementation configuration for the assertion, the configuration given here is loaded into the provided assertion dynamically. |
| `Assertions[].Category` | `string or null` | &#10006 |  | The category of the assersion. Can filter which categories to run using the -A flag |
| `Assertions[].DisplayTrace` | `string or true/false` | &#10006 | True | Whether to display the assertion's message trace in the assertion results or not. Should be set to false when the assertion trace is massive and displaying it can cause performance issues |
| `Assertions[].SaveAttachments` | `string or true/false` | &#10006 | True | Whether to save the attachments of the assertion in the test report (true) or not (false) |
| `Assertions[].SaveLogs` | `string or true/false` | &#10006 | True | Whether to save the session logs belonging to this assertion in the test report |
| `Assertions[].SaveSessionData` | `string or true/false` | &#10006 | True | Whether to save the data of the session's belonging to this assertion in the test report |
| `Assertions[].SaveTemplate` | `string or true/false` | &#10006 | True | Whether to save the configuration template in the test report (true) or not (false) |
| `Assertions[].Severity` | `one of [Trivial / Minor / Normal / Critical / Blocker]` | &#10006 |  | The severity of the assertion, can be used to set the severity of the test in the test report. |
| `Assertions[].DataSourceNames` | `list or string` | &#10006 |  | Names of the pre defined data sources to pass to the assertion |
| `Assertions[].DataSourceNames[]` | `string` | &#10006 |  |  |
| `Assertions[].DataSourcePatterns` | `list or string` | &#10006 |  | Regex patterns of data sources |
| `Assertions[].DataSourcePatterns[]` | `string` | &#10006 |  |  |
| `Assertions[].Links` | `list or string` | &#10006 |  | The assertion's specific links. Will be added with the general links. |
| `Assertions[].Links[]` | `object or string` | &#10006 |  |  |
| `Assertions[].Links[].Name` | `string or null` | &#10006 |  | The display name of the link in the test results, if none is given uses the `Type` as the name |
| `Assertions[].Links[].Grafana` | `object or string` | &#10006 |  | Links the grafana dashboard filtered for the test's session times to each test result. |
| `Assertions[].Links[].Grafana.DashboardId` | `string` | &#10004 |  | The Id of the desired dashboard to view |
| `Assertions[].Links[].Grafana.Url` | `string` | &#10004 |  | The grafana's url, the base url without any route |
| `Assertions[].Links[].Grafana.Variables` | `list or string` | &#10006 |  | The variables to display the dashboard with |
| `Assertions[].Links[].Grafana.Variables[]` | `object or string` | &#10006 |  |  |
| `Assertions[].Links[].Grafana.Variables[].Key` | `string` | &#10006 |  |  |
| `Assertions[].Links[].Grafana.Variables[].Value` | `string` | &#10006 |  |  |
| `Assertions[].Links[].Kibana` | `object or string` | &#10006 |  | Links the kibana's discovery filtered for the test's session times to each test result. |
| `Assertions[].Links[].Kibana.DataViewId` | `string` | &#10004 |  | The Id of the desired data view to view |
| `Assertions[].Links[].Kibana.Url` | `string` | &#10004 |  | The kibana's url, the base url without any route |
| `Assertions[].Links[].Kibana.KqlQuery` | `string or null` | &#10006 |  | A custom Kql query to add to the generated URL, this query is added to the session time filtering query with `and`  |
| `Assertions[].Links[].Kibana.TimestampField` | `string` | &#10006 | @timestamp | The name of the main timestamp field to use to query on specific times in given data view |
| `Assertions[].Links[].Prometheus` | `object or string` | &#10006 |  | Links the prometheus' graph filtered for the test's session times to each test result. |
| `Assertions[].Links[].Prometheus.Url` | `string` | &#10004 |  | The prometheus' url, the base url without any route |
| `Assertions[].Links[].Prometheus.Expressions` | `list or string` | &#10006 | [<br />  ""<br />] | The expressions to generate prometheus panels for |
| `Assertions[].Links[].Prometheus.Expressions[]` | `string` | &#10006 |  |  |
| `Assertions[].SessionNamePatterns` | `list or string or null` | &#10006 |  | Regex patterns of session names |
| `Assertions[].SessionNamePatterns[]` | `string` | &#10006 |  |  |
| `Assertions[].SessionNames` | `list or string or null` | &#10006 |  | The names of session datas to give the assertion |
| `Assertions[].SessionNames[]` | `string` | &#10006 |  |  |
| `Assertions[].StatusesToReport` | `list or string` | &#10006 | List containing all assertion statuses | Defines which assertion statuses will appear in the final report. Statuses explicitly listed will be included in the report, while all others will be exluded.Options: [`Passed` `Broken` `Failed` `Skipped` `Unknown` ] |
| `Assertions[].StatusesToReport[]` | `one of [Passed / Failed / Broken / Unknown / Skipped]` | &#10006 |  | 0 = Passed<br />1 = Failed<br />2 = Broken<br />3 = Unknown<br />4 = Skipped |
