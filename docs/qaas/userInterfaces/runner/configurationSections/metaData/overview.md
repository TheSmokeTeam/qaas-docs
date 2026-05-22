---
id: qaas.userinterfaces.runner.configurationsections.metadata.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, metadata, overview]
summary: "The MetaData section is used to define additional information about tests, enhancing traceability and observability. It includes the following standard fields:"
---
# MetaData

The `MetaData` section is used to define additional information about tests, enhancing traceability and observability. It includes the following standard fields:

- `Team`: The team responsible for maintaining and executing the tests.
- `System`: The system or component under test.

In addition to these standard fields, you can include custom `ExtraLabels` to further categorize tests. Examples of useful labels include:

- `Component`
- `Cluster`
- `Environment`
- `Feature`

Labels are not limited to those examples and can be anything you want.
