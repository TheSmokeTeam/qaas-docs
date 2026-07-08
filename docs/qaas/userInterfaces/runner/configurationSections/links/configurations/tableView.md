---
id: qaas.userinterfaces.runner.configurationsections.links.configurations.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, links, configurations]
summary: "Links Configurations Table View"
---

<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Links Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Links` | `list or string or null` | &#10006 |  | The links generated on test results, used to view observability data outputted by the tested application. These links are generated per test result to be relevant specifically to that test and the time it ran at |
| `Links[]` | `object or string` | &#10006 |  |  |
| `Links[].Name` | `string or null` | &#10006 |  | The display name of the link in the test results, if none is given uses the `Type` as the name |
| `Links[].Grafana` | `object or string` | &#10006 |  | Links the grafana dashboard filtered for the test's session times to each test result. |
| `Links[].Grafana.DashboardId` | `string` | &#10004 |  | The Id of the desired dashboard to view |
| `Links[].Grafana.Url` | `string` | &#10004 |  | The grafana's url, the base url without any route |
| `Links[].Grafana.Variables` | `list or string` | &#10006 |  | The variables to display the dashboard with |
| `Links[].Grafana.Variables[]` | `object or string` | &#10006 |  |  |
| `Links[].Grafana.Variables[].Key` | `string` | &#10004 |  |  |
| `Links[].Grafana.Variables[].Value` | `string` | &#10004 |  |  |
| `Links[].Kibana` | `object or string` | &#10006 |  | Links the kibana's discovery filtered for the test's session times to each test result. |
| `Links[].Kibana.DataViewId` | `string` | &#10004 |  | The Id of the desired data view to view |
| `Links[].Kibana.Url` | `string` | &#10004 |  | The kibana's url, the base url without any route |
| `Links[].Kibana.KqlQuery` | `string or null` | &#10006 |  | A custom Kql query to add to the generated URL, this query is added to the session time filtering query with `and`  |
| `Links[].Kibana.TimestampField` | `string` | &#10006 | @timestamp | The name of the main timestamp field to use to query on specific times in given data view |
| `Links[].Prometheus` | `object or string` | &#10006 |  | Links the prometheus' graph filtered for the test's session times to each test result. |
| `Links[].Prometheus.Url` | `string` | &#10004 |  | The prometheus' url, the base url without any route |
| `Links[].Prometheus.Expressions` | `list or string` | &#10006 | [<br />  ""<br />] | The expressions to generate prometheus panels for |
| `Links[].Prometheus.Expressions[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
