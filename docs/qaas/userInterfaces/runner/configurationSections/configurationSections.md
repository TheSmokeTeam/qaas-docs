# Configuration Sections

Each configuration section in the `.yaml` file is used to perform a different action and has its own configurations and descriptions.
In this part of the documentation you can read about all the possible configurations available to you within each configuration section.

The `.yaml` configuration file is divided into the following sections:

```yaml
Links: []

Storages: []

DataSources: []

Sessions: []

Assertions: []

MetaData: {}
```

## Required Fields

Required fields are fields that must be given a value and have no default value. Required fields are only required if their parent field is used.

For example, if the field in the path `SectionA.FieldA` is `required`, then as long as `SectionA` is configured it must contain the field `FieldA`:

```yaml
SectionA:
  FieldA: content
```

If `SectionA` is not used, there is no need to configure `FieldA`:

```yaml
```

## Table View Order

All configuration table views are ordered according to three rules.

1. The property paths are ordered like a YAML configuration, meaning all fields of every parent are under that parent.
2. Under every parent, fields are ordered by type: first basic types (`integer` / `number` / `string` / `bool` / `enum`), then arrays (`array`), and lastly fields that have sub-fields (`object`).
3. Under every parent, within each type batch, `required` fields come before `not required` fields.
