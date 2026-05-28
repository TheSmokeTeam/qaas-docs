# Json Configurations Yaml View

> TL;DR: Minimal YAML scaffold for Json GeneratorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
GeneratorConfiguration:
  Count: "${value}"
  JsonDataSourceName: "value"
  OutputObjectType: "Json"
  JsonFieldReplacements:
    - Path: "value"
      ValueType: "Null"
      Boolean:
        Value: "${value}"
      ByteArray:
        Value: "value"
      DateTime:
        Day: "${value}"
        DayOffset: "${value}"
        Format: "o"
        Hour: "${value}"
        HourOffset: "${value}"
        Millisecond: "${value}"
        MillisecondOffset: "${value}"
        Minute: "${value}"
        MinuteOffset: "${value}"
        Month: "${value}"
        Second: "${value}"
        SecondOffset: "${value}"
        TimeZone: "value"
        Year: "${value}"
      Double:
        Value: "${value}"
      FromDataSource:
        Name: "value"
        OutOfRangePolicy: "Null"
      Integer:
        Value: "${value}"
      String:
        Value: "value"
      UnixEpochTime:
        Day: "${value}"
        DayOffset: "${value}"
        Hour: "${value}"
        HourOffset: "${value}"
        Millisecond: "${value}"
        MillisecondOffset: "${value}"
        Minute: "${value}"
        MinuteOffset: "${value}"
        Month: "${value}"
        Second: "${value}"
        SecondOffset: "${value}"
        UnixEpochObjectType: "Long"
        UnixEpochScaleType: "Seconds"
        Year: "${value}"
  OutputObjectTypeConfiguration:
    TypeFullName: "value"
    AssemblyName: "value"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
