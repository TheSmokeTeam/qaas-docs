# Write a Test (Code)

This sample builds the same Runner configuration shape as the YAML quick start, but does it directly in `Program.cs` and gives the delay assertion a 10-second window so the documented smoke flow stays stable.

The completed sample is available at [DummyAppTests (Code)]({{ links.repository_runner_quickstart_code }}).

## Create the Project

```bash
dotnet new qaas-runner -n DummyAppTests
cd DummyAppTests
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Runner --version 4.3.0
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Assertions --version 3.3.0
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Generators --version 3.3.0
```

## Keep an Empty Bootstrap File

Runner exposes the execution builder through `Bootstrap.New(...)`, so this sample keeps an empty `test.qaas.yaml` only to initialize that builder.

`DummyAppTests/test.qaas.yaml`

```yaml
{}
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

## Build `Program.cs` in Small Pieces

`DummyAppTests/Program.cs`

### Start with the Imports and Bootstrap

The first block imports the Runner builders, falls back to `run test.qaas.yaml` when no CLI arguments are supplied, and opens the execution builder that `Bootstrap.New(...)` creates from the empty YAML file.

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
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.Serialization;
using QaaS.Runner;
using QaaS.Runner.Assertions.ConfigurationObjects;
using QaaS.Runner.Sessions.Actions.Consumers.Builders;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;
using QaaS.Runner.Sessions.Session.Builders;

var bootstrapArguments = args.Length > 0 ? args : ["run", "test.qaas.yaml"];
var runner = Bootstrap.New(bootstrapArguments);
var executionBuilder = runner.ExecutionBuilders.AsSingle();
const string inputExchangeName = "dummy-app-tests-input";
const string outputExchangeName = "dummy-app-tests-output";
```

### Create the Data Source

Start with the input payload source. This data source reads the JSON request message from the local `TestData` folder.

```csharp
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
```

### Create the RabbitMQ Connection Settings

The sample uses one shared RabbitMQ configuration object so the publisher and consumer are guaranteed to point at the same broker. It also uses dedicated exchange names so the quick-start smoke path does not collide with other RabbitMQ traffic on the same machine.

```csharp
var rabbitMqConfiguration = new BaseRabbitMqConfig
{
    Host = "127.0.0.1",
    Username = "admin",
    Password = "admin",
    VirtualHost = "/",
    Port = 5672
};
```

### Create the Publisher

The publisher takes data from `FromFileSystemTestData`, applies a simple load-balance policy, and publishes each payload into the `input` exchange.

```csharp
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
        ExchangeName = inputExchangeName,
        RoutingKey = "/"
    });
```

### Create the Consumer

The consumer listens on the `output` exchange, waits up to five seconds, and deserializes the received payload as JSON before assertions run.

```csharp
var consumer = new ConsumerBuilder()
    .Named("Consumer")
    .WithTimeout(5000)
    .Configure(new RabbitMqReaderConfig
    {
        Host = rabbitMqConfiguration.Host,
        Username = rabbitMqConfiguration.Username,
        Password = rabbitMqConfiguration.Password,
        Port = rabbitMqConfiguration.Port,
        ExchangeName = outputExchangeName,
        RoutingKey = "/"
    })
    .WithDeserializer(new DeserializeConfig
    {
        Deserializer = SerializationType.Json
    });
```

### Create the Session

The session groups the publisher and consumer into one execution flow so Runner knows which actions belong together.

```csharp
var session = new SessionBuilder()
    .Named("RabbitMqExchangeWithFromFileSystemTestData")
    .AddPublisher(publisher)
    .AddConsumer(consumer);
```

### Create the Assertions

The first assertion checks hermeticity: every published message should produce a corresponding output message. The second checks delay: each input/output pair should complete within ten seconds.

```csharp
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
        MaximumDelayMs = 10000
    });
```

### Assemble the Runner Execution

The last step attaches metadata, the data source, the session, and the assertions to the current execution builder, then starts the Runner.

```csharp
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

## Full `Program.cs`

This is the complete file exactly as it appears in the sample repository.

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
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.Serialization;
using QaaS.Runner;
using QaaS.Runner.Assertions.ConfigurationObjects;
using QaaS.Runner.Sessions.Actions.Consumers.Builders;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;
using QaaS.Runner.Sessions.Session.Builders;

var bootstrapArguments = args.Length > 0 ? args : ["run", "test.qaas.yaml"];
var runner = Bootstrap.New(bootstrapArguments);
var executionBuilder = runner.ExecutionBuilders.AsSingle();
const string inputExchangeName = "dummy-app-tests-input";
const string outputExchangeName = "dummy-app-tests-output";

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
        ExchangeName = inputExchangeName,
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
        ExchangeName = outputExchangeName,
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
        MaximumDelayMs = 10000
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

This `Program.cs` maps directly to the YAML quick start: `MetaData`, one `FromFileSystem` data source, one RabbitMQ session, and two assertions.

## Run the Code Path

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run
```

The sample expects a local RabbitMQ broker on `127.0.0.1:5672` and a component that relays the published message from `input` to `output`, the same way the quick-start CI smoke test does.
