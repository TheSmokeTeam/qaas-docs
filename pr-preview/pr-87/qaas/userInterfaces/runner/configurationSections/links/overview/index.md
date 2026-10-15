# Links

> TL;DR — Links add per-result observability URLs to Runner reports, including Kibana, Prometheus, and Grafana links.

## When to use

Links are the links generated on test results, used to view the tested application's metrics, logs, traces, or any other observability data output by the system. These links are generated per test result so they stay relevant to the specific test and the time it ran.

Links can be found by clicking the relevant test and looking at the Links section on the right side of the screen where the test metadata is displayed.

## YAML configuration

Use `Links[]` for report-level links. Use assertion-level links when the URL should appear only on a specific assertion result.

The complete schema-derived field list is in the [configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/configurations/tableView/index.md). The copy-ready scaffold is in the [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/configurations/yamlView/index.md).

## Available Link Types

### Kibana

Links to a Kibana UI.

### Prometheus

Links to the Prometheus UI.

### Grafana

Links to a Grafana dashboard.

## Edge cases

- Report-level links apply to the test result context.
- Assertion-specific links belong on the assertion configuration, not the top-level `Links` list.
- Use placeholders when link query parameters need the run, case, or environment context.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/configurations/yamlView/index.md)
- [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md)
- [Allure Report](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md)
