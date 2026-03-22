# MetaData

The `Metadata` section is used to define additional information about tests, enhancing traceability and observability. It includes the following key fields:

- **Team**: The team responsible for maintaining and executing the tests
- **System**: The system or component under test

In addition to these standard fields, you can include custom `ExtraLabels` to further categorize tests. Examples of useful labels include:

- `Component`
- `Cluster`
- `Environment`
- `Feature`

Labels are not limited to those examples and can be anything you want.

## Purpose and Usage

Metadata is embedded into test logs and sent to REDA's Elasticsearch instance for centralized observability. This enables effective monitoring and analysis through the QaaS (Quality as a Service) platform.

Each log entry also includes the hostname of the machine where the test was executed, whether locally or via CI, providing additional context for debugging and auditing.

## Observability and Dashboards

You can monitor QaaS usage and test metadata adoption using the following resources:

- **QaaS Adoption Dashboard**: `{{links.qaas_adoptation_dashboard}}`
  - User: `{{links.qaas_adoptation_dashboard_user}}`
  - Password: `{{links.qaas_adoptation_dashboard_password}}`
- **Custom Explore View**: `{{links.qaas_custom_explore_view}}`

Use the provided Elasticsearch data source to build custom dashboards and gain deeper insights into test execution patterns, team contributions, and system performance.
