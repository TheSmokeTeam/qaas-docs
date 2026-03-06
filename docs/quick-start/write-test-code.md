# Write a Test in Code

Use code when the test shape depends on runtime data, when reuse matters more than YAML readability, or when you want compile-time refactoring support.

## Equivalent to the YAML Quick Start

```csharp
using QaaS.Common.Assertions;
using QaaS.Common.Assertions.ConfigurationObjects.Delay;
using QaaS.Common.Assertions.ConfigurationObjects.Hermetics;
using QaaS.Common.Generators;
using QaaS.Common.Generators.ConfigurationObjects.ExternalSourceBasedConfiguration;
using QaaS.Framework.Policies;
using QaaS.Framework.Policies.ConfigurationObjects;
using QaaS.Framework.Protocols.ConfigurationObjects.RabbitMq;
using QaaS.Framework.Serialization;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Runner;
using QaaS.Runner.Assertions.ConfigurationObjects;
using QaaS.Runner.Sessions.Actions.Consumers.Builders;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;
using QaaS.Runner.Sessions.Session.Builders;

var rabbitMq = new BaseRabbitMqConfig
{
    Host = "localhost",
    Username = "admin",
    Password = "admin",
    Port = 5672,
    VirtualHost = "/"
};

var dataSource = new DataSourceBuilder()
    .Named("FromFileSystemTestData")
    .HookNamed(nameof(FromFileSystem))
    .Configure(new FromFileSystemConfig
    {
        DataArrangeOrder = DataArrangeOrder.AsciiAsc,
        FileSystem = new FileSystemConfig { Path = "TestData" }
    });

var publisher = new PublisherBuilder()
    .Named("Publisher")
    .AddDataSource("FromFileSystemTestData")
    .AddPolicy(new PolicyBuilder().Configure(new LoadBalancePolicyConfig { Rate = 50 }))
    .Configure(new RabbitMqSenderConfig
    {
        Host = rabbitMq.Host,
        Username = rabbitMq.Username,
        Password = rabbitMq.Password,
        Port = rabbitMq.Port,
        VirtualHost = rabbitMq.VirtualHost,
        RoutingKey = "/",
        ExchangeName = "input"
    });

var consumer = new ConsumerBuilder()
    .Named("Consumer")
    .WithTimeout(5000)
    .Configure(new RabbitMqReaderConfig
    {
        Host = rabbitMq.Host,
        Username = rabbitMq.Username,
        Password = rabbitMq.Password,
        Port = rabbitMq.Port,
        VirtualHost = rabbitMq.VirtualHost,
        RoutingKey = "/",
        ExchangeName = "output"
    })
    .WithDeserializer(new DeserializeConfig { Deserializer = SerializationType.Json });

var session = new SessionBuilder()
    .Named("RabbitMqExchangeWithFromFileSystemTestData")
    .AddPublisher(publisher)
    .AddConsumer(consumer);

var hermeticity = new AssertionBuilder()
    .Named("Hermeticity")
    .HookNamed(nameof(HermeticByInputOutputPercentage))
    .AddSessionName(session.Name!)
    .Configure(new HermeticByInputOutputPercentageConfiguration
    {
        OutputNames = [consumer.Name!],
        InputNames = [publisher.Name!],
        ExpectedPercentage = 100
    });

var delay = new AssertionBuilder()
    .Named("Delay")
    .HookNamed(nameof(DelayByChunks))
    .AddSessionName(session.Name!)
    .Configure(new DelayByChunksConfiguration
    {
        Output = new Chunk { Name = consumer.Name!, ChunkSize = 1 },
        Input = new Chunk { Name = publisher.Name!, ChunkSize = 1 },
        MaximumDelayMs = 5000
    });

var runner = Bootstrap.New(args);
runner.ExecutionBuilders.Add(
    new ExecutionBuilder()
        .AddDataSource(dataSource)
        .AddSession(session)
        .AddAssertion(hermeticity)
        .AddAssertion(delay));

runner.Run();
```

## Rules That Matter

- Builder names are not cosmetic. They are lookup keys for sessions, data sources, and assertions.
- A publisher, consumer, transaction, storage, or link can only have one active concrete configuration at a time.
- Code configuration and YAML can coexist. `Bootstrap.New(args)` still loads CLI input and file-based configuration.

## When to Stop Adding Code

If the code is mostly fixed values and duplicated object initializers, move the static parts back to YAML. Code should earn its keep by reducing repetition or enabling logic that YAML cannot express cleanly.
