# Assertions

Assertions are **hooks** that validate [QaaS.Runner](../qaas/index.md) [session data](../qaas/userInterfaces/runner/configurationSections/sessions/overview.md) after the Runner [`act`](../qaas/userInterfaces/runner/commands/act.md) phase completes. Each assertion receives the stored session data (inputs, outputs, metadata) and returns a `Pass` or `Fail` status that is written to the [Allure Report](../qaas/userInterfaces/runner/allureReport.md).

The **QaaS.Common.Assertions** NuGet package ships the built-in assertion library. You can also author custom assertions by implementing `BaseAssertion<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                          |
|----------------|--------------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Assertions`                                                 |
| **Source**     | [QaaS.Common.Assertions]({{ links.repository_assertions }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Assertions" Version="x.x.x" />
```

## Writing a Custom Assertion

See the [Write Hooks](../qaas/quickStart/writeHooks.md) guide for a step-by-step walkthrough.


<!-- generated hook catalog start -->
## Available Hooks

The built-in hooks below are grouped by implementation type so it is easier to shortlist the right hook before drilling into configuration details.

### Latency

- [DelayByAverage](availableAssertions/DelayByAverage/overview.md): Average latency. Checks for delay between an input source to an output source by subtracting the average timestamp of all inputs from the average timestamp of all the outputs.
- [DelayByChunks](availableAssertions/DelayByChunks/overview.md): Chunk latency. Checks for delay between an input source to an output source by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, takes the chunks in ascending order of the input/output lists.

### Hermeticity

- [HermeticByInputOutputPercentage](availableAssertions/HermeticByInputOutputPercentage/overview.md): Exact input/output percentage. Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output
- [HermeticByExpectedOutputCount](availableAssertions/HermeticByExpectedOutputCount/overview.md): Exact output count. Performs a hermetic test by comparing the count of a given output in a session to a given expected count
- [HermeticByInputOutputPercentageInRange](availableAssertions/HermeticByInputOutputPercentageInRange/overview.md): Input/output percentage range. Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range.
- [ValidateHermeticMetricsByInputOutputPercentage](availableAssertions/ValidateHermeticMetricsByInputOutputPercentage/overview.md): Metrics percentage validation. Compares the hermetic percentage calculated from configured inputs and outputs with the hermetic percentage reported by the metrics output.
- [HermeticByExpectedOutputCountInRange](availableAssertions/HermeticByExpectedOutputCountInRange/overview.md): Output count range. Performs a hermetic test by comparing the count of a given output in a session to a given expected minimum and maximum

### Content validation

- [OutputContentByExpectedCsvResults](availableAssertions/OutputContentByExpectedCsvResults/overview.md): CSV-driven field validation. Checks that the configured output content matches the expected values loaded from a CSV results file.

### Contract validation

- [OutputDeserializableTo](availableAssertions/OutputDeserializableTo/overview.md): Deserialization validation. Performs a logic test that checks if the items of a configured output can all be deserialized using a configured deserializer
- [ObjectOutputJsonSchema](availableAssertions/ObjectOutputJsonSchema/overview.md): JSON schema validation. Validates that each configured output item matches at least one JSON schema provided by the configured data sources.

### Transport metadata

- [HttpStatus](availableAssertions/HttpStatus/overview.md): HTTP status. Performs a logic test on the http status of all selected outputs in a session by checking they all have the desired http status code

<!-- generated hook catalog end -->
