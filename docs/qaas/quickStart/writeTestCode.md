# Write a Test (Code)

Use code configuration when the test needs normal language features such as reuse, branching, computed values, or helper methods shared across many tests. The runtime concepts stay the same as the YAML guide, but instead of authoring them in `test.qaas.yaml` you implement `IExecutionBuilderConfigurator` and let Runner apply it automatically during bootstrap.

The completed sample is available in the `code_configuration` branch of [DummyAppTests]({{ links.runner_quickstart_repository }}/tree/code_configuration).

## Keep `test.qaas.yaml` Empty

`DummyAppTests/test.qaas.yaml`

```yaml
```

Runner still expects a configuration-file argument, so keep the file in the project even when the execution is built from code. The file can stay empty because discovered configurators run after the loader creates the execution builder.

## Use the Normal Bootstrap Entry Point

`DummyAppTests/Program.cs`

```csharp
var effectiveArgs = args.Length == 0
    ? ["run", "test.qaas.yaml", "--no-env"]
    : args;

QaaS.Runner.Bootstrap.New(effectiveArgs).Run();
```

This keeps the standard CLI/bootstrap behavior, but still lets the entry assembly inject code-first configuration before execution begins.

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

## Implement `IExecutionBuilderConfigurator`

Create `DummyAppTests/RunnerExecutionBuilderConfigurator.cs` and begin with the metadata and data source. This is the code equivalent of the first YAML section from the previous guide.

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
```

`DataSourceBuilder` says exactly what the YAML version said: load payloads from the local `TestData` folder with the `FromFileSystem` generator.

## Add the Session

Next build the publisher, the consumer, and the session that groups them together.

Append this code inside `Configure`:

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
                Host = "127.0.0.1",
                Username = "admin",
                Password = "admin",
                Port = 5672,
                ExchangeName = "input",
                RoutingKey = "/"
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
```

The session code mirrors the YAML session block: one publisher sends the input to `input`, one consumer reads the output from `output`, and together they model the same RabbitMQ contract described in the YAML guide.

## Add the Assertions

Now create the two assertions that decide whether the session passed.

Append this code inside `Configure`:

```csharp
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
```

These are the same two checks as the YAML version: one checks that every input produced an output, and one checks that the output arrived quickly enough.

## Attach Everything to the Execution Builder

Finish the method by attaching the metadata, the data source, the session, and the assertions to the builder that Runner discovered for this run.

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
    }
}
```

## Full `RunnerExecutionBuilderConfigurator.cs`

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
                ExchangeName = "input",
                RoutingKey = "/"
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

## Full `Program.cs`

```csharp
var effectiveArgs = args.Length == 0
    ? ["run", "test.qaas.yaml", "--no-env"]
    : args;

QaaS.Runner.Bootstrap.New(effectiveArgs).Run();
```

## Run

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run
```

The program uses the standard Runner bootstrap, discovers `RunnerExecutionBuilderConfigurator`, and applies the code-first configuration before the execution starts.
