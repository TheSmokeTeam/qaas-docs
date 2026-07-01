---
id: qaas.userinterfaces.runner.configurationsections.reporters.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, reporters, overview]
summary: "Set run-level reporter defaults for Allure artifacts and optional ReportPortal publishing."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Reporters

> TL;DR: Use `Reporters` to set run-level reporting defaults for saved artifacts, traces, and ReportPortal publishing.

## When to use {: #when-to-use}

Use the `Reporters` section when a whole Runner configuration should share the same reporting behavior. These values are optional. When a value is not set here, each assertion keeps control through its own reporting keys.

`Reporters` is useful for CI and triage profiles where every assertion result should include the same diagnostic payloads, such as saved session data, attachments, logs, templates, or assertion traces.

## YAML configuration {: #yaml-configuration}

```yaml
Reporters:
  SaveSessionData: true
  SaveAttachments: true
  SaveLogs: true
  SaveTemplate: true
  DisplayTrace: true
  ReportPortal:
    Enabled: true
    Endpoint: 'https://reportportal.example/api/'
    Project: '{MetaData.Team}'
    ApiKey: '${REPORT_PORTAL_API_KEY}'
```

The complete schema-derived field list is in the [configuration table](configurations/tableView.md). The copy-ready scaffold is in the [YAML scaffold](configurations/yamlView.md).

## Reporting defaults {: #reporting-defaults}

The artifact flags apply to reporters created for assertion results:

- `SaveSessionData` controls saved session data attachments.
- `SaveAttachments` controls assertion-provided attachments.
- `SaveLogs` controls session log attachments.
- `SaveTemplate` controls the rendered configuration template attachment.
- `DisplayTrace` controls whether assertion traces are rendered in report details.

When any of these values is omitted, Runner falls back to the matching assertion-level value.

## ReportPortal {: #reportportal}

`ReportPortal` configures optional publishing in addition to the Allure output. `Enabled` controls whether ReportPortal publishing is active. `Endpoint`, `Project`, and `ApiKey` can override registered runtime defaults for a single run.

If `Project` is omitted, Runner uses the `MetaData.Team` value. Keep API keys in runtime variables or secret-backed placeholders rather than committed YAML.

## Edge cases {: #edge-cases}

- `Reporters` is optional; Runner still creates its default reporters when the section is absent.
- Assertion-level reporting keys are still valid and remain the fallback when run-level reporter defaults are not set.
- ReportPortal publishing requires a reachable endpoint and a key with access to the target project.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [Assertions](../assertions/overview.md)
- [Allure Report](../../allureReport.md)
- [Debug Failures](../../../../quickStart/debugTestFailure.md)
