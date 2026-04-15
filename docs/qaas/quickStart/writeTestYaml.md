# Write a Test (YAML)

Use YAML when you want the test flow to stay declarative, easy to diff, and easy to hand to someone who does not need to read C# first. QaaS.Runner loads the YAML into an execution builder, so the YAML sections below map directly to the runtime concepts you will keep using later: [MetaData](../userInterfaces/runner/configurationSections/metaData/overview.md), [DataSources](../userInterfaces/runner/configurationSections/dataSources/overview.md), [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md), and [Assertions](../userInterfaces/runner/configurationSections/assertions/overview.md).

This sample publishes one message to RabbitMQ's `dummy-app-tests-input` exchange, waits for a response on the `dummy-app-tests-output` exchange, and verifies both delivery and timing.

The completed sample is available at [DummyAppTests (YAML)]({{ links.repository_runner_quickstart_yaml }}).

## Create the Project

```bash
dotnet new qaas-runner -n DummyAppTests
cd DummyAppTests
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Assertions
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Generators
```

## Keep `Program.cs` Minimal

`DummyAppTests/Program.cs`

```csharp
QaaS.Runner.Bootstrap.New(args).Run();
```

The host stays small because the entire test definition will live in `test.qaas.yaml`. With this YAML-only host, empty program arguments now show help text, so the run command must pass `run test.qaas.yaml` explicitly.

## Add the Test Data

`DummyAppTests/TestData/input.json`

```json
[
  {
    "id": 1,
    "message": "hello from DummyAppTests"
  }
]
```

The sample publishes this payload to RabbitMQ and then checks that it comes back through the expected `dummy-app-tests-input` to `dummy-app-tests-output` flow.

## Start with `MetaData` and `DataSources`

Start the file with the parts that describe the test at a high level and tell Runner where the input data comes from.

`DummyAppTests/test.qaas.yaml`

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
```

[MetaData](../userInterfaces/runner/configurationSections/metaData/overview.md) makes the run easier to identify later in reports. [DataSources](../userInterfaces/runner/configurationSections/dataSources/overview.md) says: "load the test payloads from the local `TestData` folder."

## Add the `Sessions` Section

Next add the session that performs the real work. A session groups the actions that exercise the system under test. In this sample the publisher writes to RabbitMQ's `dummy-app-tests-input` exchange and the consumer listens on the `dummy-app-tests-output` exchange.

Append this section to `test.qaas.yaml`:

```yaml
Sessions:
  - Name: RabbitMqExchangeWithFromFileSystemTestData
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
          Port: 5672
          ExchangeName: dummy-app-tests-input
          RoutingKey: /
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          Port: 5672
          ExchangeName: dummy-app-tests-output
          RoutingKey: /
        Deserialize:
          Deserializer: Json
```

The [Publisher](../userInterfaces/runner/configurationSections/sessions/types/publishers.md) sends every payload loaded by `FromFileSystemTestData` to the `dummy-app-tests-input` exchange. The [Consumer](../userInterfaces/runner/configurationSections/sessions/types/consumers.md) listens on the `dummy-app-tests-output` exchange, waits up to five seconds, and deserializes the received body as JSON. In a real test, your application or local quick-start environment should move the message from `dummy-app-tests-input` to `dummy-app-tests-output`.

## Add the `Assertions` Section

Finally add the assertions that decide whether the test passed.

Append this section to `test.qaas.yaml`:

```yaml
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
      MaximumDelayMs: 10000
```

`HermeticByInputOutputPercentage` from [QaaS.Common.Assertions](../../assertions/index.md) checks that every input produced a matching output. `DelayByChunks` from [QaaS.Common.Assertions](../../assertions/index.md) checks that the output arrives within ten seconds.

## Full `test.qaas.yaml`

This is the complete authored configuration after all three sections are combined:

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

Sessions:
  - Name: RabbitMqExchangeWithFromFileSystemTestData
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
          Port: 5672
          ExchangeName: dummy-app-tests-input
          RoutingKey: /
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          Port: 5672
          ExchangeName: dummy-app-tests-output
          RoutingKey: /
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
      MaximumDelayMs: 10000
```

## Run

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run -- run test.qaas.yaml
```

## Result

Runner publishes the JSON payload from `TestData/input.json` to `dummy-app-tests-input`, then waits for the corresponding response on `dummy-app-tests-output`. The consumer verifies both 100% hermeticity and a maximum end-to-end delay of 10000 ms. Once you connect a real application, that application should be the component that consumes from `dummy-app-tests-input` and publishes to `dummy-app-tests-output`.
