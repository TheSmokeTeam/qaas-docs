---
id: generators.available.jsonschemadraft4.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, JsonSchemaDraft4, yaml, scaffold]
summary: "Minimal YAML scaffold for JsonSchemaDraft4 GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# JsonSchemaDraft4 Configurations Yaml View

> TL;DR: Minimal YAML scaffold for JsonSchemaDraft4 GeneratorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
GeneratorConfiguration:
  Count: "${value}"
  JsonDataSourceName: "value"
  OutputObjectType: "Json"
  Seed: "${value}"
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

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
