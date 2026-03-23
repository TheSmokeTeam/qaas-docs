# Write a Test (YAML)

This sample publishes one message to RabbitMQ, consumes it back from the same exchange and routing key, and verifies both delivery and timing.

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

## Configure `test.qaas.yaml`

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
          ExchangeName: amq.direct
          RoutingKey: dummyapp
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: 127.0.0.1
          Username: admin
          Password: admin
          Port: 5672
          ExchangeName: amq.direct
          RoutingKey: dummyapp
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

The sample uses RabbitMQ's built-in `amq.direct` exchange and the routing key `dummyapp`.

## Start RabbitMQ

```bash
docker run --rm -d --name qaas-runner-rabbit \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER=admin \
  -e RABBITMQ_DEFAULT_PASS=admin \
  rabbitmq:4-management
```

## Run

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run -- run test.qaas.yaml
```

## Result

Runner publishes the JSON payload from `TestData/input.json`, reads it back through the consumer, and verifies both 100% hermeticity and a maximum end-to-end delay of 5000 ms.
