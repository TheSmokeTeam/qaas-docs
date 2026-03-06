## QaaS.Common.Generators Zero-to-Hero

### Overview

[`QaaS.Common.Generators`](https://github.com/TheSmokeTeam/QaaS.Common.Generators) provides reusable generator hooks for `QaaS.Runner` data sources.

Generator families:

| Family | Hooks |
| --- | --- |
| External sources | `FromFileSystem`, `LettuceFromFileSystem`, `FromS3` |
| Other data sources | `FromDataSources`, `FromLettuceDataSources`, `FromSessionDataDataSources`, `Stacking` |
| Structured payload generation | `Json`, `JsonSchemaDraft4` |
| Remote query generation | `FromDataLake` |

### Architecture & Connections

- Generators implement contracts from `QaaS.Framework.Executions`.
- They are configured through `DataSourceBuilder` in `QaaS.Framework.SDK`.
- Runner data sources can chain generator outputs together by name or pattern.

### Quick Start

```bash
dotnet restore D:/QaaS/QaaS.Common.Generators/QaaS.Common.Generators.sln
dotnet build D:/QaaS/QaaS.Common.Generators/QaaS.Common.Generators.sln -c Release --no-restore
dotnet test D:/QaaS/QaaS.Common.Generators/QaaS.Common.Generators.sln -c Release --no-build
dotnet add package QaaS.Common.Generators
```

### Technical Reference

- External-source generators read files, S3 objects, or data-lake query results.
- Data-source generators compose or reshape outputs from other runner data sources.
- JSON generators either mutate seed JSON documents or synthesize data from a Draft 4 schema.

Dependency notes:

- [YamlDotNet](https://github.com/aaubry/YamlDotNet)
- [JsonPath.Net](https://www.nuget.org/packages/JsonPath.Net/)
- [QaaS.Framework.Executions](https://www.nuget.org/packages/QaaS.Framework.Executions/)

### Troubleshooting & Links

- If a generator yields no data, inspect data-source chaining first. Missing `DataSourceNames` is the most common cause.
- `Stacking` requires the `ItemsPerGenerator` array to stay aligned with the configured generator inputs.
- `Json` and `JsonSchemaDraft4` can fail because of parser or output-type configuration, not only because of generation rules.

- Source: [TheSmokeTeam/QaaS.Common.Generators](https://github.com/TheSmokeTeam/QaaS.Common.Generators)
- NuGet: [QaaS.Common.Generators](https://www.nuget.org/packages/QaaS.Common.Generators/)
