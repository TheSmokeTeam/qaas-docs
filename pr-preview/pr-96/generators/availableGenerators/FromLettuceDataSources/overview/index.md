# FromLettuceDataSources

> TL;DR — Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into Json

## When to use

Consumes attached data sources whose bodies are lettuce-style JSON envelopes, base64-decodes the `Body`, and emits the decoded payload as the generated item.

When the lettuce envelope contains a RabbitMQ routing key, that routing key is copied into the generated item metadata so publisher or consumer flows can reuse it naturally.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
DataSources:
  - Name: LettuceEvents
    Generator: FromFileSystem
    Deserialize:
      Deserializer: Json
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/lettuce
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: DecodedEvents
    Generator: FromLettuceDataSources
    DataSourceNames:
      - LettuceEvents
    GeneratorConfiguration:
      Count: 5
```

## Realistic example

`LettuceEvents` loads JSON envelope files, and `DecodedEvents` converts those envelopes into raw payload bytes.

With this setup, the first five decoded messages become available to the rest of the configuration, and any routing key carried inside each lettuce envelope is preserved in RabbitMQ metadata.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromLettuceDataSources/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromLettuceDataSources/configuration/yamlView/index.md)
- [Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
