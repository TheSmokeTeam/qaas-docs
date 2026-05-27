---
id: generators.available.fromlettucedatasources.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromLettuceDataSources, configuration, reference]
summary: "Field-by-field reference for FromLettuceDataSources GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---

# FromLettuceDataSources Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from multiple DataSources that contain lettuce files. `DataSources`: Used, must all contain Lettuce formatted data deserialized into Json (JsonNode). `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `integer or string or null` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
