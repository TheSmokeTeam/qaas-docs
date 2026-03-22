# Configuration Sections

The `mocker.qaas.yaml` file is divided into the sections below. Each section configures a different aspect of the mock runtime.

The preferred top-level layout is:

```yaml
DataSources: []

Stubs: []

Controller: {}

Servers: []
```

`Servers` is the preferred format for new configurations. The legacy `Server` property is still supported by the runtime as a single-server shorthand, but the documentation on this site uses `Servers`.

## Table View Order

All configuration table views follow three rules:

1. Property paths follow the YAML hierarchy.
2. Under every parent, primitive fields come before arrays and nested objects.
3. The pages document the current property names and preferred `Servers` model from the live `QaaS.Mocker` source.
