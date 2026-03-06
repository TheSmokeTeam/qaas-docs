## QaaS.Common.Assertions Zero-to-Hero

### Overview

[`QaaS.Common.Assertions`](https://github.com/TheSmokeTeam/QaaS.Common.Assertions) packages reusable assertion hooks for `QaaS.Runner`. The repository is intentionally focused: one runtime package and one NUnit test project.

Assertion families:

| Family | Hooks |
| --- | --- |
| Hermetic counts | `HermeticByExpectedOutputCount`, `HermeticByExpectedOutputCountInRange` |
| Hermetic percentages | `HermeticByInputOutputPercentage`, `HermeticByInputOutputPercentageInRange`, `ValidateHermeticMetricsByInputOutputPercentage` |
| Delay | `DelayByAverage`, `DelayByChunks` |
| Content | `OutputContentByExpectedCsvResults` |
| Schema | `ObjectOutputJsonSchema` |
| Deserialization | `OutputDeserializableTo` |
| HTTP metadata | `HttpStatus` |

### Architecture & Connections

- The hooks implement assertion contracts defined in `QaaS.Framework.Executions`.
- They are consumed through `QaaS.Runner.Assertions.AssertionBuilder`.
- They operate on session outputs plus optional data sources or metrics.

### Quick Start

```bash
dotnet restore D:/QaaS/QaaS.Common.Assertions/QaaS.Common.Assertions.sln
dotnet build D:/QaaS/QaaS.Common.Assertions/QaaS.Common.Assertions.sln -c Release --no-restore
dotnet test D:/QaaS/QaaS.Common.Assertions/QaaS.Common.Assertions.sln -c Release --no-build
dotnet add package QaaS.Common.Assertions
```

### Technical Reference

- Hermetic assertions compare counts or percentages between inputs and outputs.
- Delay assertions compare timestamps globally or in chunks.
- Content assertions compare payload fields against CSV-driven expectations.
- Schema assertions validate outputs against JSON schema documents.
- Deserialization assertions verify a configured deserializer can parse outputs.
- `HttpStatus` validates status metadata without inspecting the response body.

Dependency notes:

- [JsonSchema.Net](https://docs.json-everything.net/)
- [JsonPath.Net](https://www.nuget.org/packages/JsonPath.Net/)
- [QaaS.Framework.Executions](https://www.nuget.org/packages/QaaS.Framework.Executions/)

### Troubleshooting & Links

- If an assertion cannot find outputs, start with the runner-side session filters and output names.
- `OutputContentByExpectedCsvResults` is the most configuration-heavy hook. Validate the CSV mapping before debugging the validator itself.
- Schema failures are often deserialization failures in disguise.

- Source: [TheSmokeTeam/QaaS.Common.Assertions](https://github.com/TheSmokeTeam/QaaS.Common.Assertions)
- NuGet: [QaaS.Common.Assertions](https://www.nuget.org/packages/QaaS.Common.Assertions/)
