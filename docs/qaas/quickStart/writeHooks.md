# Writing Custom Hooks in QaaS for Advanced Testing

When the built-in [Plugins](../addOns/plugins.md) and packaged hooks do not provide sufficient functionality for your test requirements, custom hooks can be implemented in a C# project to extend [QaaS.Framework](../../framework/index.md). This guide demonstrates how to create and integrate custom [QaaS.Common.Generators](../../generators/index.md), [QaaS.Common.Assertions](../../assertions/index.md), and [QaaS.Common.Probes](../../probes/index.md) style hooks to test a specific condition:

> *The application receives a JSON array as input and sends a JSON array with the same number of items as output.*

## 1. Creating a Custom Generator: `JsonArrayGenerator`

A generator produces test data for [DataSources](../userInterfaces/runner/configurationSections/dataSources/overview.md) and implements the `IGenerator` interface from the `QaaS.Framework.SDK` package. We extend `BaseGenerator<T>` with a configuration record that includes validation and default values.

### Generator Configuration Record

```csharp
using System.Collections.Immutable;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Nodes;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Generator;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace DummyAppTests;

/// <summary>
/// Configuration for JsonArrayGenerator with required and optional settings.
/// </summary>
public record JsonArrayGeneratorConfiguration
{
    [Required]
    public uint? Count { get; set; }

    public uint NumberOfItemsPerArray { get; set; } = 5;
}
```

### Generator Implementation

```csharp
/// <summary>
/// Generates a specified number of JSON arrays, each containing a configurable number of items.
/// </summary>
public class JsonArrayGenerator : BaseGenerator<JsonArrayGeneratorConfiguration>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        for (var generatedDataIndex = 0; generatedDataIndex < Configuration.Count; generatedDataIndex++)
        {
            var jsonArray = new JsonArray();
            for (var jsonArrayItemIndex = 0; jsonArrayItemIndex < Configuration.NumberOfItemsPerArray; jsonArrayItemIndex++)
                jsonArray.Add("SomeItem");

            yield return new Data<object>
            {
                Body = jsonArray
            };
        }
    }
}
```

### File System Structure After Addition

```plaintext
DummyAppTests/
|-- DummyAppTests.csproj
|-- Program.cs
|-- JsonArrayGenerator.cs
|-- LengthAssertion.cs
|-- PrintCurrentTimeProbe.cs
|-- test.qaas.yaml
|-- Variables/
|   |-- local.yaml
|   `-- k8s.yaml
`-- TestData/
```

## 2. Configuring the Generator in `DataSources`

Define a [DataSource](../userInterfaces/runner/configurationSections/dataSources/overview.md) in `test.qaas.yaml` that uses the custom generator with specific configuration.

```yaml
DataSources:
  - Name: 10Samples
    Generator: JsonArrayGenerator
    GeneratorConfiguration:
      Count: 10
      NumberOfItemsPerArray: 5
```

This creates 10 JSON arrays, each with 5 items.

## 3. Using the DataSource in a New Session

Create a new [Session](../userInterfaces/runner/configurationSections/sessions/overview.md) that uses the `10Samples` data source. Since the data is JSON, a `Serializer` must be configured.

```yaml
Sessions:
  - Name: RabbitMqExchangeWith10Samples
    Publishers:
      - Name: Publisher
        DataSourceNames: [10Samples]
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: input
        Serialize:
          Serializer: Json
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json
```

## 4. Adding Common Assertions

Apply standard [QaaS.Common.Assertions](../../assertions/index.md) to the new session for hermeticity and delay.

```yaml
Assertions:
  - Name: HermeticByInputOutputPercentage
    Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100

  - Name: DelayByChunks
    Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
```

## 5. Creating a Custom Assertion: `LengthAssertion`

To verify that output JSON arrays have the expected length, implement a custom assertion in the same style as [QaaS.Common.Assertions](../../assertions/index.md).

### Assertion Configuration Record

```csharp
using System.Collections.Immutable;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Nodes;
using QaaS.Framework.Serialization;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.SDK.Hooks.Assertion;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace DummyAppTests;

/// <summary>
/// Configuration for LengthAssertion to validate output array length.
/// </summary>
public record LengthAssertionConfiguration
{
    [Required]
    public uint? ExpectedLength { get; set; }

    [Required]
    public string? OutputName { get; set; }
}
```

### Assertion Implementation

```csharp
/// <summary>
/// Asserts that all output JSON arrays have the expected number of items.
/// </summary>
public class LengthAssertion : BaseAssertion<LengthAssertionConfiguration>
{
    public override bool Assert(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var output = sessionDataList.AsSingle()
            .GetOutputByName(Configuration.OutputName!)
            .CastCommunicationData<JsonArray>();

        var invalidOutputs = output.Data
            .Select((item, index) => new { Index = index, ActualLength = item.Body?.Count })
            .Where(item => item.ActualLength != Configuration.ExpectedLength)
            .ToArray();

        AssertionMessage = $"Number of outputs that were not the expected length is {invalidOutputs.Length}";
        AssertionTrace = invalidOutputs.Length == 0
            ? "All outputs matched the expected length."
            : string.Join(Environment.NewLine, invalidOutputs.Select(item =>
                $"Output #{item.Index} had length {item.ActualLength?.ToString() ?? "null"}."));
        AssertionAttachments.Add(new AssertionAttachment
        {
            Path = "length-assertion/summary.json",
            Data = new
            {
                ExpectedLength = Configuration.ExpectedLength,
                InvalidOutputCount = invalidOutputs.Length,
                InvalidOutputs = invalidOutputs
            },
            SerializationType = SerializationType.Json
        });

        return invalidOutputs.Length == 0;
    }
}
```

### Assertion Result Fields

`BaseAssertion<TConfiguration>` gives custom assertions a few result fields that are picked up by Runner reporting:

- `AssertionMessage` becomes the Allure status message for passed, failed, skipped, and unknown assertion results.
- `AssertionTrace` becomes the Allure status trace when the assertion's `DisplayTrace` configuration is true. Set `DisplayTrace: false` when the trace is very large or sensitive.
- `AssertionAttachments` stores extra files with the assertion result. Each `AssertionAttachment` needs a relative `Path`, the `Data` to persist, and an optional `SerializationType`. If `SerializationType` is null, the data is treated as raw bytes.
- `AssertionStatus` can explicitly override the boolean returned from `Assert(...)`. Leave it unset for the usual `true` to `Passed` and `false` to `Failed` mapping. Any exception thrown from `Assert(...)` is reported as `Broken`.

### Assertion YAML Usage

```yaml
Assertions:
  - Name: LengthAssertion
    Assertion: LengthAssertion
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputName: Consumer
      ExpectedLength: 5
```

## 6. Creating a Custom Probe: `PrintCurrentTimeProbe`

A probe executes custom logic during test execution. Here is a simple probe that logs the current UTC time.

### Probe Implementation

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Probe;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace DummyAppTests;

/// <summary>
/// Prints the current UTC time to the console.
/// Probes can perform more complex operations using session data and configurations.
/// </summary>
public class PrintCurrentTimeProbe : BaseProbe<object>
{
    public override void Run(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var currentTime = DateTime.UtcNow;
        Console.WriteLine($"Current time is: {currentTime}");
    }
}
```

### Probe YAML Usage

```yaml
Sessions:
  - Name: RabbitMqExchangeWithFromFileSystemTestData
    Probes:
      - Probe: PrintCurrentTimeProbe
        Name: GetCurrentTime

---
```

## Final `test.qaas.yaml` Overview

```yaml
MetaData:
  Team: Smoke
  System: DummyApp

DataSources:
  - Name: FromFileSystemTestData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: TestData
  - Name: 10Samples
    Generator: JsonArrayGenerator
    GeneratorConfiguration:
      Count: 10
      NumberOfItemsPerArray: 5

Sessions:
  - Name: RabbitMqExchangeWithFromFileSystemTestData
    Probes:
      - Probe: PrintCurrentTimeProbe
        Name: GetCurrentTime
    Publishers:
      - Name: Publisher
        DataSourceNames: [FromFileSystemTestData]
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json
  - Name: RabbitMqExchangeWith10Samples
    Publishers:
      - Name: Publisher
        DataSourceNames: [10Samples]
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: input
        Serialize:
          Serializer: Json
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json

Assertions:
  - Name: HermeticByInputOutputPercentage
    Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
  - Name: DelayByChunks
    Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
  - Name: HermeticByInputOutputPercentage
    Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
  - Name: DelayByChunks
    Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
  - Name: LengthAssertion
    Assertion: LengthAssertion
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputName: Consumer
      ExpectedLength: 5
```
