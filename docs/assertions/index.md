# Assertions

Assertions are **hooks** that validate session data after the Runner's `act` phase completes. Each assertion receives the stored session data (inputs, outputs, metadata) and returns a `Pass` or `Fail` status that is written to the [Allure report](../qaas/userInterfaces/runner/allureReport.md).

The **QaaS.Common.Assertions** NuGet package ships the built-in assertion library. You can also author custom assertions by implementing `BaseAssertion<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

| | |
|---|---|
| **Package** | `QaaS.Common.Assertions` |
| **Source** | [Repository — QaaS.Common.Assertions]({{ links.repository_assertions }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md) |

## Installation

```xml
<PackageReference Include="QaaS.Common.Assertions" Version="*" />
```

## Available Assertions

| Assertion | Category | Purpose |
|---|---|---|
| [HermeticByExpectedOutputCount](availableAssertions/HermeticByExpectedOutputCount/overview.md) | Hermetic | Output count equals expected value |
| [HermeticByExpectedOutputCountInRange](availableAssertions/HermeticByExpectedOutputCountInRange/overview.md) | Hermetic | Output count within min/max range |
| [HermeticByInputOutputPercentage](availableAssertions/HermeticByInputOutputPercentage/overview.md) | Hermetic | Output/input ratio meets threshold |
| [HermeticByInputOutputPercentageInRange](availableAssertions/HermeticByInputOutputPercentageInRange/overview.md) | Hermetic | Output/input ratio within range |
| [ValidateHermeticMetricsByInputOutputPercentage](availableAssertions/ValidateHermeticMetricsByInputOutputPercentage/overview.md) | Hermetic | Validate Prometheus metrics against I/O ratio |
| [DelayByAverage](availableAssertions/DelayByAverage/overview.md) | Delay | Average processing delay within threshold |
| [DelayByChunks](availableAssertions/DelayByChunks/overview.md) | Delay | Per-chunk delay validation |
| [HttpStatus](availableAssertions/HttpStatus/overview.md) | HTTP | Validates HTTP response status codes |
| [OutputDeserializableTo](availableAssertions/OutputDeserializableTo/overview.md) | Schema | Output is deserializable to a given type |
| [ObjectOutputJsonSchema](availableAssertions/ObjectOutputJsonSchema/overview.md) | Schema | Output matches a JSON Schema |
| [OutputContentByExpectedCsvResults](availableAssertions/OutputContentByExpectedCsvResults/overview.md) | Content | Field-level comparison against CSV expected results |

## Writing a Custom Assertion

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for a step-by-step walkthrough.
