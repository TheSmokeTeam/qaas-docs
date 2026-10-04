# JsonSchemaDraft4

> TL;DR — Generates JSON data that conforms to a configured JSON Schema Draft 4 document.

## When to use

Generates JSON documents from a Draft 4 JSON schema and then applies the same field-replacement system used by the regular `Json` generator.

This is useful when you want structurally valid random test data but still need certain fields pinned to known values. An optional seed makes the random generation repeatable across runs.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
DataSources:
  - Name: OrderSchema
    Generator: FromFileSystem
    Deserialize:
      Deserializer: Json
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/json-schema
        SearchPattern: 'order-schema.json'
      StorageMetaData: ItemName

  - Name: GeneratedSchemaOrders
    Generator: JsonSchemaDraft4
    DataSourceNames:
      - OrderSchema
    GeneratorConfiguration:
      JsonDataSourceName: OrderSchema
      Count: 3
      Seed: 42
      JsonFieldReplacements:
        - Path: $.priority
          ValueType: String
          String:
            Value: high
```

## Realistic example

This example reads a Draft 4 schema from `order-schema.json`, generates three schema-valid JSON documents from it, and then forces the `priority` field in each document to `high`.

Because the seed is fixed to `42`, the random parts of the generated payloads stay repeatable between runs.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/JsonSchemaDraft4/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/JsonSchemaDraft4/configuration/yamlView/index.md)
- [Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
