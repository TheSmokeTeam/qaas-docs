# ObjectOutputJsonSchema

Validates that each configured output item matches at least one JSON schema provided by the configured data sources.

> Logical group: Contract validation / JSON schema validation

> Logical group: Contract validation / JSON schema validation

## What It Does

Loads every schema document provided by the attached data sources, converts each item in the named output to JSON, and validates each output item against all of the supplied schemas until at least one schema matches.

The assertion produces a detailed summary: whether all outputs passed, all failed, or the result was mixed, plus per-item validation details in the trace. It throws when schema documents are missing or malformed, or when an output item cannot be converted to JSON at all.

## YAML Example

```yaml
DataSources:
  - Name: OrderSchemas
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: schemas
        SearchPattern: '*.json'
      StorageMetaData: ItemName

Sessions:
  - Name: SampleSession

Assertions:
  - Name: ObjectOutputJsonSchemaAssertion
    Assertion: ObjectOutputJsonSchema
    SessionNames:
      - SampleSession
    DataSourceNames:
      - OrderSchemas
    AssertionConfiguration:
      OutputName: Reply
```

## What This Configuration Does

This snippet attaches a schema source called `OrderSchemas` and then validates every item captured under the `Reply` output of `SampleSession` against the schemas loaded from that data source.

An output item passes when it matches at least one provided schema. If a reply matches none of them, the assertion fails and records the first failing item plus the schema-validation errors in the trace.
