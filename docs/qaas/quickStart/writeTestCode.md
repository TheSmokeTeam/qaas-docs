# Write a Test (Code)

Use code configuration when the test should stay in normal C#: helper methods, branching, computed values, and shared building blocks are all easier there. The public quick-start sample keeps two entry paths in the same host:

- `dotnet run` uses the code-defined execution in `Program.cs`
- `dotnet run -- run test.qaas.yaml` uses the checked-in YAML file instead
- `dotnet run -- template` prints the YAML-equivalent shape of the code-defined execution so you can diff it against the YAML sample

The completed sample is available at [DummyAppTests (Code)]({{ links.repository_runner_quickstart_code }}).

## Create the Project

```bash
dotnet new qaas-runner -n DummyAppTests
cd DummyAppTests
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Assertions
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Generators
```

## Clear the Launch Arguments

The YAML template path uses `run test.qaas.yaml` launch arguments so `dotnet run` works for the YAML quick start. For the code quick start, remove those launch arguments so `dotnet run` is a real no-args invocation.

`DummyAppTests/Properties/launchSettings.json`

```json
{
  "$schema": "http://json.schemastore.org/launchsettings.json",
  "profiles": {
    "QaaS Runner": {
      "commandName": "Project"
    }
  }
}
```

## Keep the YAML Baseline

The code sample keeps the same authored YAML as the YAML quick start so explicit `run` still works and the code path can be validated against a real file.

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

## Replace `Program.cs`

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

if (ShouldUseCodeConfiguration(args, out var codeExecutionMode))
{
    if (codeExecutionMode == CodeExecutionMode.Template)
    {
        RenderCodeTemplate();
        return;
    }

    var runner = Bootstrap.New(BuildCodeBootstrapArguments());
    if (runner.ExecutionBuilders.Count > 0)
        ConfigureExecution(runner.ExecutionBuilders.Single());

    runner.Run();
    return;
}

Bootstrap.New(args).Run();

return;

static bool ShouldUseCodeConfiguration(string[] args, out CodeExecutionMode codeExecutionMode)
{
    if (args.Any(IsHelpOrVersionOption))
    {
        codeExecutionMode = default;
        return false;
    }

    if (args.Length == 0)
    {
        codeExecutionMode = CodeExecutionMode.Run;
        return true;
    }

    if (args[0].Equals("template", StringComparison.OrdinalIgnoreCase) && !HasExplicitTemplateConfigurationPath(args))
    {
        codeExecutionMode = CodeExecutionMode.Template;
        return true;
    }

    codeExecutionMode = default;
    return false;
}

static string[] BuildCodeBootstrapArguments()
{
    return ["run", EnsureCodeBootstrapFile()];
}

static string EnsureCodeBootstrapFile()
{
    var path = Path.Combine(AppContext.BaseDirectory, "code-bootstrap.qaas.yaml");
    if (!File.Exists(path))
        File.WriteAllText(path, string.Empty);

    return path;
}

static void RenderCodeTemplate()
{
    Console.WriteLine(File.ReadAllText(Path.Combine(AppContext.BaseDirectory, "test.qaas.yaml")));
}

static bool HasExplicitTemplateConfigurationPath(IReadOnlyList<string> args)
{
    return args.Count > 1 && !args[1].StartsWith("-", StringComparison.Ordinal);
}

static bool IsHelpOrVersionOption(string argument)
{
    return argument.Equals("--help", StringComparison.OrdinalIgnoreCase) ||
           argument.Equals("-h", StringComparison.OrdinalIgnoreCase) ||
           argument.Equals("--version", StringComparison.OrdinalIgnoreCase);
}

static void ConfigureExecution(ExecutionBuilder executionBuilder)
{
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
}

enum CodeExecutionMode
{
    Run,
    Template
}
```

The host keeps three behaviors in one place:

- no args: build the execution in code and run it
- `template` with no file: print the YAML-equivalent shape of that code-defined execution
- explicit `run ...` or `run test.qaas.yaml`: stay on the normal YAML/bootstrap path

## Run the Code Path

From `DummyAppTests/DummyAppTests`:

```bash
dotnet run
```

## Validate That the Code Path Matches YAML

```bash
dotnet run -- template
```

That output should match the authored `test.qaas.yaml` shape shown above.

## Run the YAML Path From the Same Host

```bash
dotnet run -- run test.qaas.yaml
```

The sample expects a local RabbitMQ broker on `127.0.0.1:5672` and a component that relays the published message from `input` to `output`, the same way the quick-start CI smoke test does.
