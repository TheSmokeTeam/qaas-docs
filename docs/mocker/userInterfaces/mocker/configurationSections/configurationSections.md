# Configuration Sections

`mocker.qaas.yaml` is divided into the sections below. Each section configures a different part of the mock runtime.

```yaml
DataSources: []

Stubs: []

Controller:
  ServerName:
  Redis: {}

Server: {}

Servers: []
```

## Choosing Between `Server` and `Servers`

Use exactly one of the following top-level sections:

- `Server` to run one mock server
- `Servers` to run multiple server runtimes from the same process

Do not configure both in the same file.

When `Servers` is used, action names must be unique across all configured servers.

## Configuration Overrides

The CLI can layer configuration in this order:

1. base YAML file
2. `--overwrite-files`
3. `--overwrite-arguments`
4. configuration-like environment variables unless `--no-env` is used

Environment-variable overrides are intentionally limited to the known mocker section roots:

- `DataSources`
- `Stubs`
- `Controller`
- `Server`
- `Servers`

Both `:` and `__` separators are supported. For example:

```text
Servers__0__Http__Port=18443
Controller:Redis:Host=localhost:6379
```

## Required Fields

Required fields are fields that must be given a value and have no default value. A required field is only required when its parent section is used.

For example, if `SectionA.FieldA` is required, then configuring `SectionA` means `FieldA` must be present:

```yaml
SectionA:
  FieldA: content
```

If `SectionA` is not used, `FieldA` does not need to be configured.

## Table View Order

All configuration table views are ordered according to these rules:

1. Property paths follow YAML nesting, so child fields appear under their parent.
2. Under each parent, basic types (`integer`, `number`, `string`, `bool`, `enum`) come first, then arrays, then nested objects.
3. Within each type group, required fields come before optional fields.
