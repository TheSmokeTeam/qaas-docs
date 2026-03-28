# Json

Generates JSON data from a configured prototype document.

> Logical group: Structured payloads / Prototype JSON

## What It Does

Clones a prototype JSON document from an attached JSON data source and applies configured field replacements before emitting the result.

The output can stay as JSON, or it can be parsed into another supported object type. Replacements can inject literal values, pull values from other data sources, or generate time-based values.

## YAML Example

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

## What This Configuration Does

This setup reads `order-template.json`, clones that JSON twice, and updates two fields in each cloned document before exposing the generated items.

`customerId` is replaced with `CUST-001`, `priority` is set to `true`, and the output remains JSON because `OutputObjectType` is `Json`.
