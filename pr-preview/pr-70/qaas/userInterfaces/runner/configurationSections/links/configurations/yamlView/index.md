# Links Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example

```yaml
Links:
  -
    Name: 'value'
    Grafana:
      DashboardId: 'value'
      Url: 'value'
      Variables:
        -
          Key: 'value'
          Value: 'value'
    Kibana:
      DataViewId: 'value'
      Url: 'value'
      KqlQuery: 'value'
      TimestampField: '@timestamp'
    Prometheus:
      Url: 'value'
      Expressions:
        - 'value'
```

## Realistic example

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/configurations/tableView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/overview/index.md)
