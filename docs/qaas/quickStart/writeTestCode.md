# Write a Test (Code)

Use code configuration when the test should stay in normal C#: helper methods, branching, computed values, and shared building blocks are all easier there. The runtime behavior stays identical to the YAML guide, but this version keeps the full test definition in `Program.cs`.

The completed sample is available at [DummyAppTests (Code)]({{ links.repository_runner_quickstart_code }}).

## Keep `test.qaas.yaml` Empty

`DummyAppTests/test.qaas.yaml`

```yaml
# Intentionally blank. Program.cs builds the execution definition after bootstrap loads this file.
```

Runner still expects a configuration-file argument, so the code sample keeps the empty file in place and then builds the execution definition in `Program.cs`.

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

## Build the Test in `Program.cs`

`DummyAppTests/Program.cs`

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

var runner = QaaS.Runner.Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.Single();

var dataSource = new DataSourceBuilder()
    .Named("FromFileSystemTestData")
    .HookNamed(nameof(FromFileSystem))
    .Configure(new FromFileSystemConfig
    {
        DataArrangeOrder = DataArrangeOrder.AsciiAsc,
        FileSystem = new FileSystemConfig
        {
            Path = Path.Combine(AppContext.BaseDirectory, "TestData")
        }
    });

var rabbitMqConfiguration = new BaseRabbitMqConfig
{
    Host = "127.0.0.1",
    Username = "admin",
    Password = "admin",
    VirtualHost = "/",
    Port = 5672
};

var publisher = new PublisherBuilder()
    .Named("Publisher")
    .AddDataSource("FromFileSystemTestData")
    .AddPolicy(new PolicyBuilder().Configure(new LoadBalancePolicyConfig
    {
        Rate = 50
    }))
    .Configure(new RabbitMqSenderConfig
    {
        Host = rabbitMqConfiguration.Host,
        Username = rabbitMqConfiguration.Username,
        Password = rabbitMqConfiguration.Password,
        Port = rabbitMqConfiguration.Port,
        ExchangeName = "input",
        RoutingKey = "/"
    });

var consumer = new ConsumerBuilder()
    .Named("Consumer")
    .WithTimeout(5000)
    .Configure(new RabbitMqReaderConfig
    {
        Host = rabbitMqConfiguration.Host,
        Username = rabbitMqConfiguration.Username,
        Password = rabbitMqConfiguration.Password,
        Port = rabbitMqConfiguration.Port,
        ExchangeName = "output",
        RoutingKey = "/"
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
    .AddSessionName(session.Name!)
    .Configure(new HermeticByInputOutputPercentageConfiguration
    {
        OutputNames = [consumer.Name!],
        InputNames = [publisher.Name!],
        ExpectedPercentage = 100
    });

var delayAssertion = new AssertionBuilder
    {
        AssertionInstance = null!,
        Reporter = null!
    }
    .Named("DelayByChunks")
    .HookNamed(nameof(DelayByChunks))
    .AddSessionName(session.Name!)
    .Configure(new DelayByChunksConfiguration
    {
        Output = new Chunk
        {
            Name = consumer.Name!,
            ChunkSize = 1
        },
        Input = new Chunk
        {
            Name = publisher.Name!,
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

runner.Run();
```

This keeps the standard bootstrap path intact:

- `Bootstrap.New(...)` parses the normal Runner CLI arguments.
- `runner.ExecutionBuilders.Single()` gives you the builder created from `test.qaas.yaml`.
- The rest of `Program.cs` updates that builder with the exact same data source, session, and assertions shown in the YAML guide.

## Run

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run -- run test.qaas.yaml --no-env
```

If you want to pass different Runner flags, append them after `dotnet run --`.
