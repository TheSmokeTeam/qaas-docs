# Configuration Sections

The QaaS configuration `.yaml` file is divided into the sections below. Each section configures a different aspect of the test.
In this part of the documentation you can read about all the possible configurations available to you within each configuration section.


The `.yaml` configuration file is divided into the following sections

```yaml
Links: []

Storages: {}

DataSources: []

Sessions: []

Assertions: []

MetaData: []
```

## Required fields

Required fields are fields that must be given a value and have no default value, required fields are only required if their parent field is used.

For example if the field in the path `SectionA.FieldA` is `required` then as long as `SectionA` is configured it must contain the field `FieldA` like so:

```yaml
SectionA:
  FieldA: content
```

however if we dont use `SectionA` there is no need to configure the field `FieldA`:

```yaml
```

## Table View Order

All Configurations Table Views are ordered according to 3 rules.

1. The property paths are ordered like a yaml configuration, meaning all fields of every parent are under the parent.

2. Under every parent its fields are ordered by type, first basic types (`integer` / `number` / `string` / `bool`/ `enum`), then arrays (`array`) and lastly fields that have sub-fields (`object`).

3. Under every parent within the batch of a certain type first come the `required` fields and then the `not required` fields.
