# Configuration Sections

The QaaS Runner YAML file is divided into the sections below. Each section configures a different part of the test execution model.

The current top-level layout is:

```yaml
Links: []

Storages: []

DataSources: []

Sessions: []

Assertions: []

MetaData: {}
```

## Table View Order

All configuration table views follow three rules.

1. Property paths follow the YAML hierarchy.
2. Under every parent, primitive fields come before arrays and nested objects.
3. The pages document the current property names from the live `QaaS.Runner` source.
