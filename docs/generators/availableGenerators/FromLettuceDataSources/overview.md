---
id: generators.available.fromlettucedatasources.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromLettuceDataSources, GeneratorConfiguration]
summary: "Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into <see cref=\"SerializationType.Json\"/>"
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromLettuceDataSources.cs -->

# FromLettuceDataSources

> TL;DR: Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into <see cref="SerializationType.Json"/>

Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into Json

## What It Does {: #what-it-does}

Consumes attached data sources whose bodies are lettuce-style JSON envelopes, base64-decodes the `Body`, and emits the decoded payload as the generated item.

When the lettuce envelope contains a RabbitMQ routing key, that routing key is copied into the generated item metadata so publisher or consumer flows can reuse it naturally.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

`LettuceEvents` loads JSON envelope files, and `DecodedEvents` converts those envelopes into raw payload bytes.

With this setup, the first five decoded messages become available to the rest of the configuration, and any routing key carried inside each lettuce envelope is preserved in RabbitMQ metadata.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
