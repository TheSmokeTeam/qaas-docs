# Json Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use

Use this page when you need a starting YAML shape for this hook configuration and want all generated fields in one block.

## YAML configuration

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example

```yaml
GeneratorConfiguration:
  Count: 0
  JsonDataSourceName: 'value'
  OutputObjectType: 'Json'
  JsonFieldReplacements:
    - Path: 'value'
      ValueType: 'Null'
      Boolean:
        Value: True
      ByteArray:
        Value: 'value'
      DateTime:
        Day: 0
        DayOffset: 0
        Format: 'o'
        Hour: 0
        HourOffset: 0
        Millisecond: 0
        MillisecondOffset: 0
        Minute: 0
        MinuteOffset: 0
        Month: 0
        Second: 0
        SecondOffset: 0
        TimeZone: 'value'
        Year: 0
      Double:
        Value: 1.0
      FromDataSource:
        Name: 'value'
        OutOfRangePolicy: 'Null'
      Integer:
        Value: 0
      String:
        Value: 'value'
      UnixEpochTime:
        Day: 0
        DayOffset: 0
        Hour: 0
        HourOffset: 0
        Millisecond: 0
        MillisecondOffset: 0
        Minute: 0
        MinuteOffset: 0
        Month: 0
        Second: 0
        SecondOffset: 0
        UnixEpochObjectType: 'Long'
        UnixEpochScaleType: 'Seconds'
        Year: 0
  OutputObjectTypeConfiguration:
    TypeFullName: 'value'
    AssemblyName: 'value'
```

## Realistic example

Start with the minimal scaffold, replace placeholder values with project values, and combine it with the surrounding hook entry shown on the overview page.

## Edge cases

- Optional arrays are emitted as `[]`; add entries only when the hook needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/Json/configuration/tableView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/Json/overview/index.md)
