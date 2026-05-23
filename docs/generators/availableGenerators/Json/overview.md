---
id: generators.available.json.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, Json, GeneratorConfiguration]
summary: "Generates JSON data from a configured prototype document."
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\JsonGenerators\Json.cs -->

# Json

> TL;DR — Generates JSON data from a configured prototype document.

## When to use {: #when-to-use}

Clones a prototype JSON document from an attached JSON data source and applies configured field replacements before emitting the result.

The output can stay as JSON, or it can be parsed into another supported object type. Replacements can inject literal values, pull values from other data sources, or generate time-based values.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
DataSources:
  - Name: OrderPrototype
    Generator: FromFileSystem
    Deserialize:
      Deserializer: Json
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/json
        SearchPattern: 'order-template.json'
      StorageMetaData: ItemName

  - Name: GeneratedOrders
    Generator: Json
    DataSourceNames:
      - OrderPrototype
    GeneratorConfiguration:
      JsonDataSourceName: OrderPrototype
      Count: 2
      OutputObjectType: Json
      JsonFieldReplacements:
        - Path: $.customerId
          ValueType: String
          String:
            Value: CUST-001
        - Path: $.priority
          ValueType: Boolean
          Boolean:
            Value: true
```

## Realistic example {: #realistic-example}

This setup reads `order-template.json`, clones that JSON twice, and updates two fields in each cloned document before exposing the generated items.

`customerId` is replaced with `CUST-001`, `priority` is set to `true`, and the output remains JSON because `OutputObjectType` is `Json`.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Generators](../../index.md)
