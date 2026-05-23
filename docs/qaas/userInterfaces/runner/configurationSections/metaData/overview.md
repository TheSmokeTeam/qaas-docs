---
id: qaas.userinterfaces.runner.configurationsections.metadata.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, metadata, overview]
summary: "Define test ownership, system identity, and optional labels for Runner reports and filtering."
---

# MetaData

The `MetaData` section is used to define additional information about tests, enhancing traceability and observability. It includes the following standard fields:

> TL;DR: Use `MetaData` to identify the team, system, and optional labels that should travel with a Runner configuration.

## When to use {: #when-to-use}

- You want reports and logs to carry ownership and system context.
- You need environment, component, feature, or cluster labels for filtering.
- You want shared labels available across cases and overwrite files.

- `Team`: The team responsible for maintaining and executing the tests.
- `System`: The system or component under test.

In addition to these standard fields, you can include custom `ExtraLabels` to further categorize tests. Examples of useful labels include:

- `Component`
- `Cluster`
- `Environment`
- `Feature`

Labels are not limited to those examples and can be anything you want.

## See also {: #see-also}

- [Configuration sections](../configurationSections.md)
- [MetaData YAML](configurations/yamlView.md)
- [MetaData table](configurations/tableView.md)
