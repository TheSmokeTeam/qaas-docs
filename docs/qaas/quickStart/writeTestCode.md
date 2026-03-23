# Write a Test (Code)

This version builds the same RabbitMQ verification flow directly in C# while keeping `Program.cs` to the bootstrap call only.

The completed sample is available in the `code_configuration` branch of [DummyAppTests]({{ links.repository_runner_quickstart }}/tree/code_configuration).

## Keep `test.qaas.yaml` Empty

`DummyAppTests/test.qaas.yaml`

```yaml
```

If the file is missing, Runner logs a warning and continues with discovered code configurators. The sample keeps the file empty so the command stays identical to the YAML sample.

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

## Build the Execution in Code

`DummyAppTests/RunnerExecutionBuilderConfigurator.cs`

```csharp
using QaaS.Common.Assertions.CommonAssertionsConfigs.Delay;
using QaaS.Common.Assertions.CommonAssertionsConfigs.Hermetic;
using QaaS.Common.Assertions.Delay;
using QaaS.Common.Assertions.Hermetic;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.Policies;
using QaaS.Framework.Policies.ConfigurationObjects;
using QaaS.Framework.Protocols.ConfigurationObjects.RabbitMq;
using QaaS.Framework.SDK;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.Serialization;
using QaaS.Runner;
using QaaS.Runner.Assertions.ConfigurationObjects;
using QaaS.Runner.Sessions.Actions.Consumers.Builders;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;
using QaaS.Runner.Sessions.Session.Builders;

namespace DummyAppTests;

public sealed class RunnerExecutionBuilderConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        var dataSource = new DataSourceBuilder()
            .Named("FromFileSystemTestData")
            .HookNamed(nameof(FromFileSystem))
            .Configure(new FromFileSystemConfig
            {
                DataArrangeOrder = DataArrangeOrder.AsciiAsc,
                FileSystem = new FileSystemConfig
                {
                    Path = "TestData"
                }
            });

        var publisher = new PublisherBuilder()
            .Named("Publisher")
            .AddDataSource("FromFileSystemTestData")
            .AddPolicy(new PolicyBuilder().Configure(new LoadBalancePolicyConfig
            {
                Rate = 50
            }))
            .Configure(new RabbitMqSenderConfig
            {
                Host = "127.0.0.1",
                Username = "admin",
                Password = "admin",
                Port = 5672,
                ExchangeName = "amq.direct",
                RoutingKey = "dummyapp"
            });

        var consumer = new ConsumerBuilder()
            .Named("Consumer")
            .WithTimeout(5000)
            .Configure(new RabbitMqReaderConfig
            {
                Host = "127.0.0.1",
                Username = "admin",
                Password = "admin",
                Port = 5672,
                ExchangeName = "amq.direct",
                RoutingKey = "dummyapp"
            })
            .WithDeserializer(new DeserializeConfig
            {
                Deserializer = SerializationType.Json
            });

        var session = new SessionBuilder()
            .Named("RabbitMqExchangeWithFromFileSystemTestData")
            .AddPublisher(publisher)
            .AddConsumer(consumer);

        var hermeticAssertion = new AssertionBuilder
            {
                AssertionInstance = null!,
                Reporter = null!
            }
            .Named("HermeticByInputOutputPercentage")
            .HookNamed(nameof(HermeticByInputOutputPercentage))
            .AddSessionName("RabbitMqExchangeWithFromFileSystemTestData")
            .Configure(new HermeticByInputOutputPercentageConfiguration
            {
                OutputNames = ["Consumer"],
                InputNames = ["Publisher"],
                ExpectedPercentage = 100
            });

        var delayAssertion = new AssertionBuilder
            {
                AssertionInstance = null!,
                Reporter = null!
            }
            .Named("DelayByChunks")
            .HookNamed(nameof(DelayByChunks))
            .AddSessionName("RabbitMqExchangeWithFromFileSystemTestData")
            .Configure(new DelayByChunksConfiguration
            {
                Output = new Chunk
                {
                    Name = "Consumer",
                    ChunkSize = 1
                },
                Input = new Chunk
                {
                    Name = "Publisher",
                    ChunkSize = 1
                },
                MaximumDelayMs = 5000
            });

        executionBuilder
            .WithMetadata(new MetaDataConfig
            {
                Team = "Smoke",
                System = "DummyApp"
            })
            .AddDataSource(dataSource)
            .AddSession(session)
            .AddAssertion(hermeticAssertion)
            .AddAssertion(delayAssertion);
    }
}
```

## Run

Start RabbitMQ as shown in [Run Test](runTest.md), then run the sample:

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run -- run test.qaas.yaml
```
