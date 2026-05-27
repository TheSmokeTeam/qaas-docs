# DataSources Configurations Yaml View

> TL;DR: Data source configuration YAML example.

```yaml
DataSources:
  - Generator: "FromCSV"
    Name: "value"
    GeneratorConfiguration: "${value}"
    Lazy: "${value}"
    DataSourceNames:
      - "value"
    DataSourcePatterns:
      - "value"
    Deserialize:
      Deserializer: "Binary"
      SpecificType:
        TypeFullName: "value"
        AssemblyName: "value"
    Serialize:
      Serializer: "Binary"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
