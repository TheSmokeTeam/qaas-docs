# Write a Test (YAML)

Use YAML when you want the test flow to stay declarative, easy to diff, and easy to hand to someone who does not need to read C# first. QaaS.Runner loads the YAML into an execution builder, so the YAML sections below map directly to the runtime concepts you will keep using later: metadata, data sources, sessions, and assertions.

This sample publishes one message to RabbitMQ's `input` exchange, waits for a response on the `output` exchange, and verifies both delivery and timing.

The completed sample is available in the `yaml_configuration` branch of [DummyAppTests]({{ links.repository_runner_quickstart }}/tree/yaml_configuration).

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

The host stays small because the entire test definition will live in `test.qaas.yaml`.

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

The sample publishes this payload to RabbitMQ and then checks that it comes back through the expected `input` to `output` flow.

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

`MetaData` makes the run easier to identify later in reports. `DataSources` says: "load the test payloads from the local `TestData` folder."

## Add the `Sessions` Section

Next add the session that performs the real work. A session groups the actions that exercise the system under test. In this sample the publisher writes to RabbitMQ's `input` exchange and the consumer listens on the `output` exchange, which matches the older DummyApp contract from the previous docs.

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
          ExchangeName: input
          RoutingKey: /
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          Port: 5672
          ExchangeName: output
          RoutingKey: /
        Deserialize:
          Deserializer: Json
```

The publisher sends every payload loaded by `FromFileSystemTestData` to the `input` exchange. The consumer listens on the `output` exchange, waits up to five seconds, and deserializes the received body as JSON. In a real test, your application or local quick-start environment should move the message from `input` to `output`.

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
      MaximumDelayMs: 5000
```

`HermeticByInputOutputPercentage` checks that every input produced a matching output. `DelayByChunks` checks that the output arrives within five seconds.

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
          ExchangeName: input
          RoutingKey: /
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          Port: 5672
          ExchangeName: output
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
      MaximumDelayMs: 5000
```

## Run

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run -- run test.qaas.yaml
```

## Result

Runner publishes the JSON payload from `TestData/input.json` to `input`, then waits for the corresponding response on `output`. The consumer verifies both 100% hermeticity and a maximum end-to-end delay of 5000 ms. Once you connect a real application, that application should be the component that consumes from `input` and publishes to `output`.
