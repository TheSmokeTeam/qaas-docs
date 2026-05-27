---
id: qaas.userinterfaces.runner.configurationsections.links.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, links, overview]
summary: "Links add per-result observability URLs to Runner reports, including Kibana, Prometheus, and Grafana links."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Links

> TL;DR — Links add per-result observability URLs to Runner reports, including Kibana, Prometheus, and Grafana links.

## When to use {: #when-to-use}

Links are the links generated on test results, used to view the tested application's metrics, logs, traces, or any other observability data output by the system. These links are generated per test result so they stay relevant to the specific test and the time it ran.

Links can be found by clicking the relevant test and looking at the Links section on the right side of the screen where the test metadata is displayed.

## YAML configuration {: #yaml-configuration}

Use `Links[]` for report-level links. Use assertion-level links when the URL should appear only on a specific assertion result.

The complete schema-derived field list is in the [configuration table](configurations/tableView.md). The copy-ready scaffold is in the [YAML scaffold](configurations/yamlView.md).

## Available Link Types {: #available-link-types}

### Kibana {: #kibana}

Links to a Kibana UI.

### Prometheus {: #prometheus}

Links to the Prometheus UI.

### Grafana {: #grafana}

Links to a Grafana dashboard.

## Edge cases {: #edge-cases}

- Report-level links apply to the test result context.
- Assertion-specific links belong on the assertion configuration, not the top-level `Links` list.
- Use placeholders when link query parameters need the run, case, or environment context.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [Assertions](../assertions/overview.md)
- [Allure Report](../../allureReport.md)
