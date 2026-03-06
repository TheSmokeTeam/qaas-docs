# MetaData

The `MetaData` section is used to attach business context to a test run so the results are easier to filter, search, and explain later.

Common fields include:

- `Team`
- `System`
- custom `ExtraLabels`

Typical extra labels include:

- `Component`
- `Cluster`
- `Environment`
- `Feature`

## Why It Matters

Metadata becomes part of the execution context that travels with logs and result output. That makes it easier to answer questions such as:

- which team owns the failing test
- which environment the run targeted
- which system or feature area is affected

## Guidance

- keep label names stable across teams
- use metadata for ownership and environment context, not for large free-form notes
- prefer a small set of consistently used labels over many one-off labels
