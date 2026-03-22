# Write Test With Code

The completed sample is available in the `code_configuration` branch of [qaas-runner-quickstart]({{ links.runner_quickstart_repository }}/tree/code_configuration).

That branch keeps a minimal `test.qaas.yaml` file because the Runner bootstrap still expects a configuration path, but the test sections themselves are configured in code.

Now that we've covered how to configure the test using `test.qaas.yaml`, let's explore how to achieve the **exact same behavior** using **C# code** instead. This approach gives you full programmatic control, better type safety, and easier refactoring, ideal for complex or evolving test scenarios.

We'll walk through each code block, explaining its purpose and how it maps to the YAML configuration from the previous section.

## 1. Define the Data Source Using `FromFileSystem` Generator

This block sets up a data source that reads JSON files from the `TestData` folder, using the `FromFileSystem` generator from the `QaaS.Common.Generators` plugin.

```csharp
var fromFileSystemTestDataConfiguration = new FromFileSystemConfig
{
    DataArrangeOrder = DataArrangeOrder.AsciiAsc,
    FileSystem = new FileSystemConfig
    {
        Path = "TestData"
    }
};

var fromFileSystemTestData =
    new DataSourceBuilder().Named("FromFileSystemTestData").HookNamed(nameof(FromFileSystem))
        .Configure(fromFileSystemTestDataConfiguration);
```

- `FromFileSystemConfig` configures how the generator behaves:
  - `DataArrangeOrder = AsciiAsc`: Ensures files are processed in lexicographic (alphabetical) order.
  - `FileSystem.Path = "TestData"`: Points to the directory containing your JSON input samples.
- `DataSourceBuilder` creates a reusable data source named `FromFileSystemTestData`.
- `.HookNamed(nameof(FromFileSystem))` tells QaaS to use the `FromFileSystem` generator.

## 2. Configure RabbitMQ Connection Settings

This defines the common RabbitMQ connection parameters used across both publisher and consumer.

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

- `BaseRabbitMqConfig` holds shared connection settings.
- `Host`, `Username`, `Password`, `Port`, and `VirtualHost` match the application spec.
- The `VirtualHost` is set to `/` (default), which is standard unless otherwise configured.

## 3. Set Up the Publisher with Load Balancing at 50 msg/s

This builds the publisher that sends messages to the `input` exchange at a rate of 50 messages per second.

```csharp
var amqpPublisher = new PublisherBuilder().Named("Publisher")
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

- `.Named("Publisher")`: Gives the publisher a unique name for reference.
- `.AddDataSource("FromFileSystemTestData")`: Links the publisher to the previously defined data source.
- `.AddPolicy(...)`: Applies a `LoadBalance` policy with `Rate = 50`, ensuring the average publishing rate is 50 messages per second.
- `.Configure(new RabbitMqSenderConfig ...)`: Finalizes the RabbitMQ-specific sending behavior:
    - Sends to `input` exchange.
    - Uses the routing key `/`.
    - Uses the shared connection settings.

## 4. Set Up the Consumer with JSON Deserialization

This configures the consumer to listen to the `output` exchange and deserialize received messages as JSON.

```csharp
var amqpConsumer = new ConsumerBuilder().Named("Consumer")
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

- `.Named("Consumer")`: Names the consumer for use in assertions.
- `.Configure(new RabbitMqReaderConfig ...)`: Sets up the RabbitMQ connection for consuming from the `output` exchange.
- `.WithTimeout(5000)`: Sets a 5-second timeout (5000 ms) for waiting for messages and matches the YAML `TimeoutMs`.
- `.WithDeserializer(...)`: Specifies that incoming `byte[]` data should be deserialized into .NET objects using `Json`.

## 5. Build the Session with Publisher and Consumer

Now we combine the publisher and consumer into a single test session.

```csharp
var session = new SessionBuilder().Named("RabbitMqExchangeWithFromFileSystemTestData")
    .AddPublisher(amqpPublisher)
    .AddConsumer(amqpConsumer);
```

- `SessionBuilder` creates a test session named `RabbitMqExchangeWithFromFileSystemTestData`.
- `.AddPublisher(...)` and `.AddConsumer(...)` attach the previously built actions.

## 6. Configure the Hermeticity Assertion (100% Output Match)

We assert that every input message has a corresponding output meaning that the app is 100% hermetic.

```csharp
var hermeticsConfiguration = new HermeticByInputOutputPercentageConfiguration
{
    OutputNames = [amqpConsumer.Name!],
    InputNames = [amqpPublisher.Name!],
    ExpectedPercentage = 100
};

var hermetics = new AssertionBuilder().Named("Hermetics")
    .AddSessionName(session.Name!)
    .HookNamed(nameof(HermeticByInputOutputPercentage))
    .Configure(hermeticsConfiguration);
```

- `HermeticByInputOutputPercentageConfiguration` defines:
  - Which output (`Consumer`) and input (`Publisher`) to compare.
  - `ExpectedPercentage = 100`: Ensures **all** inputs have a matching output.
- `AssertionBuilder` creates an assertion named `Hermetics`.
- `.HookNamed(nameof(HermeticByInputOutputPercentage))`: Uses the  `HermeticByInputOutputPercentage` assertion from `QaaS.Common.Assertions`.

## 7. Configure the Delay Assertion (Max 5s Between Messages)

We verify that the application processes messages within 5 seconds.

```csharp
var delayConfiguration = new DelayByChunksConfiguration
{
    Output = new Chunk
    {
        Name = amqpConsumer.Name!,
        ChunkSize = 1
    },
    Input = new Chunk
    {
        Name = amqpPublisher.Name!,
        ChunkSize = 1
    },
    MaximumDelayMs = 5000
};

var delay = new AssertionBuilder().Named("Delay")
    .AddSessionName(session.Name!)
    .HookNamed(nameof(DelayByChunks))
    .Configure(delayConfiguration);
```

- `DelayByChunksConfiguration` checks the time between **individual chunks** of input and output.
  - `ChunkSize = 1`: Compares each message individually (not in batches).
  - `MaximumDelayMs = 5000`: Ensures no message takes longer than 5 seconds to process.
- `AssertionBuilder` creates a `Delay` assertion tied to the session.
- Uses the `DelayByChunks` assertion from `QaaS.Common.Assertions`.

## 8. Finalize the Test Runner with All Components

This is the final step: assembling everything into the QaaS test runner.

```csharp
var runner = Bootstrap.New(args);
runner.ExecutionBuilders.Add(new ExecutionBuilder()
    .AddSession(session)
    .AddDataSource(fromFileSystemTestData)
    .AddAssertion(delay)
    .AddAssertion(hermetics));
```

- `Bootstrap.New(args)` initializes the QaaS test runner with command-line arguments.
- `ExecutionBuilder` builds the execution plan:
  - `.AddSession(session)`: Adds the main test session.
  - `.AddDataSource(fromFileSystemTestData)`: Registers the data source.
  - `.AddAssertion(delay)` and `.AddAssertion(hermetics)`: Adds both assertions.
- The runner will now execute:
  1. Load data from `TestData`.
  2. Publish at 50 msg/s to `input` exchange.
  3. Consume from `output` exchange with JSON deserialization.
  4. Validate hermeticity and delay.

## Running The Configured Test

In order to actually run the test we just configured we need to add the following line:

```csharp
runner.Run();
```

If we don't, the test will simply never run.

## Combining Code Configuration With YAML

We are not limited to configuring tests with just code or `YAML`, and anything configured in `YAML` files is still available for code-based access and updates. More information here: [Configuration As Code](../advancedConcepts/configurationAsCode.md).
