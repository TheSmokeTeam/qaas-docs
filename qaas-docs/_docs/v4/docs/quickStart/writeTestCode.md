# Write Test With Code

The same runner behavior you can describe in `test.qaas.yaml` can also be built directly in C#. This is useful when:

- configuration depends on runtime conditions
- you want stronger refactoring support from the compiler
- the same session or assertion pattern is reused across many tests

The example below mirrors the YAML quick start: one filesystem-backed data source, one RabbitMQ session, and two assertions.

## 1. Define the data source

```csharp
var fromFileSystemTestDataConfiguration = new FromFileSystemConfig
{
    DataArrangeOrder = DataArrangeOrder.AsciiAsc,
    FileSystem = new FileSystemConfig
    {
        Path = "TestData"
    }
};

var fromFileSystemTestData = new DataSourceBuilder()
    .Named("FromFileSystemTestData")
    .HookNamed(nameof(FromFileSystem))
    .Configure(fromFileSystemTestDataConfiguration);
```

This creates a named data source that uses the `FromFileSystem` generator to enumerate files from `TestData`.

## 2. Reuse common RabbitMQ connection settings

```csharp
var rabbitMqConfiguration = new BaseRabbitMqConfig
{
    Host = "rabbitmq",
    Username = "admin",
    Password = "admin",
    VirtualHost = "/",
    Port = 5672
};
```

Keeping shared protocol settings in one object makes it easier to reuse them across the publisher and consumer.

## 3. Build the publisher

```csharp
var publisher = new PublisherBuilder().Named("Publisher")
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
        RoutingKey = "/",
        Port = rabbitMqConfiguration.Port,
        ExchangeName = "input"
    });
```

This matches the YAML publisher configuration:

- it reads from the named data source
- it applies a `LoadBalance` policy with a rate of `50`
- it publishes to the `input` exchange

## 4. Build the consumer

```csharp
var consumer = new ConsumerBuilder().Named("Consumer")
    .Configure(new RabbitMqReaderConfig
    {
        Host = rabbitMqConfiguration.Host,
        Username = rabbitMqConfiguration.Username,
        Password = rabbitMqConfiguration.Password,
        RoutingKey = "/",
        Port = rabbitMqConfiguration.Port,
        ExchangeName = "output"
    })
    .WithTimeout(5000)
    .WithDeserializer(new DeserializeConfig
    {
        Deserializer = SerializationType.Json
    });
```

The important parts are the timeout and the deserializer. The consumer receives serialized bytes from RabbitMQ and converts them into JSON-backed .NET objects before assertions run.

## 5. Combine both sides into a session

```csharp
var session = new SessionBuilder()
    .Named("RabbitMqExchangeWithFromFileSystemTestData")
    .AddPublisher(publisher)
    .AddConsumer(consumer);
```

Sessions are the unit that groups the actions you want QaaS to execute together.

## 6. Add assertions

Hermeticity:

```csharp
var hermeticity = new AssertionBuilder().Named("Hermetics")
    .AddSessionName(session.Name!)
    .HookNamed(nameof(HermeticByInputOutputPercentage))
    .Configure(new HermeticByInputOutputPercentageConfiguration
    {
        OutputNames = [consumer.Name!],
        InputNames = [publisher.Name!],
        ExpectedPercentage = 100
    });
```

Delay:

```csharp
var delay = new AssertionBuilder().Named("Delay")
    .AddSessionName(session.Name!)
    .HookNamed(nameof(DelayByChunks))
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
```

## 7. Register everything with the runner

```csharp
var runner = Bootstrap.New(args);
runner.ExecutionBuilders.Add(new ExecutionBuilder()
    .AddDataSource(fromFileSystemTestData)
    .AddSession(session)
    .AddAssertion(delay)
    .AddAssertion(hermeticity));
```

## 8. Run it

```csharp
runner.Run();
```

Without `runner.Run()`, the configuration is created but nothing is executed.

## Mixing YAML and C#

You do not need to choose one style forever. A common pattern is:

- keep the main test flow in YAML
- add or modify pieces in `Program.cs`
- use `dotnet run -- template test.qaas.yaml` to inspect the final resolved result

That approach lets new contributors start from YAML while still giving experienced contributors full control when the test logic grows more complex.
