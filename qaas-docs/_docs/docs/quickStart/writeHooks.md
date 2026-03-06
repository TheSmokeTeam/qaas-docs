# Writing Custom Hooks in QaaS for Advanced Testing

When the built-in `QaaS` plugins do not provide sufficient functionality for testing requirements, custom hooks can be implemented in a C# project to extend the framework’s capabilities. This guide demonstrates how to create and integrate custom `Generator`, `Assertion`, and `Probe` hooks to test a specific condition:

> *The application receives a JSON array as input and sends a JSON array with the same number of items as output.*

---

## 1. Creating a Custom Generator: `JsonArrayGenerator`

A generator produces test data and implements the `IGenerator` interface from the `QaaS.Framework.SDK` package. We extend `BaseGenerator<T>` with a configuration record that includes validation and default values.

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
├── DummyAppTests.csproj
├── Program.cs
├── JsonArrayGenerator.cs
├── LengthAssertion.cs
├── PrintCurrentTimeProbe.cs
├── test.qaas.yaml
├── Variables/
│   ├── local.yaml
│   └── k8s.yaml
└── TestData/
```

---

## 2. Configuring the Generator in `DataSources`

Define a `DataSource` in `test.qaas.yaml` that uses the custom generator with specific configuration.

```yaml
DataSources:
  - Name: 10Samples
    Generator: JsonArrayGenerator
    GeneratorConfiguration:
      Count: 10
      NumberOfItemsPerArray: 5
```

This creates 10 JSON arrays, each with 5 items.

---

## 3. Using the DataSource in a New Session

Create a new session that uses the `10Samples` data source. Since the data is JSON, a `Serializer` must be configured.

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
          Host: rabbitmq
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
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json
```

---

## 4. Adding Common Assertions

Apply standard assertions to the new session for hermeticity and delay.

```yaml
Assertions:
  - Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100

  - Assertion: DelayByChunks
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

---

## 5. Creating a Custom Assertion: `LengthAssertion`

To verify that output JSON arrays have the expected length, implement a custom `IAssertion`.

### Assertion Configuration Record

```csharp
using System.Collections.Immutable;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Nodes;
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

        var countOfOutputsNotTheCorrectLength = output.Data.Count(item => item.Body?.Count != Configuration.ExpectedLength);

        AssertionMessage = $"Number of outputs that were not the expected length is {countOfOutputsNotTheCorrectLength}";
        return countOfOutputsNotTheCorrectLength == 0;
    }
}
```

### Assertion YAML Usage

```yaml
Assertions:
  - Assertion: LengthAssertion
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputName: Consumer
      ExpectedLength: 5
```

---

## 6. Creating a Custom Probe: `PrintCurrentTimeProbe`

A probe executes custom logic during test execution. Here’s a simple probe that logs the current UTC time.

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
anchors: {}

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
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: rabbitmq
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
          Host: rabbitmq
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
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json

Assertions:
  - Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
  - Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
  - Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
  - Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
  - Assertion: LengthAssertion
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputName: Consumer
      ExpectedLength: 5
```
