# Write a Test (Code)

This version builds the same `DummyAppMock` verification flow directly in C#.

The completed sample is available in the `code_configuration` branch of [DummyAppTests]({{ links.runner_quickstart_repository }}/tree/code_configuration).

## Keep the Bootstrap File

Runner still expects a configuration path, so the sample keeps a minimal `test.qaas.yaml`.

`DummyAppTests/test.qaas.yaml`

```yaml
MetaData:
  Team: Smoke
  System: DummyApp

DataSources: []

Sessions: []

Assertions: []
```

## Add the Request Input

`DummyAppTests/Requests/request.json`

```json
{}
```

## Build the Execution in Code

`DummyAppTests/Program.cs`

```csharp
using QaaS.Common.Assertions.CommonAssertionsConfigs.HttpMetaDataLogic;
using QaaS.Common.Assertions.HttpMetaDataLogic;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.Protocols.ConfigurationObjects.Http;
using QaaS.Framework.SDK;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Runner;
using QaaS.Runner.Assertions.ConfigurationObjects;
using QaaS.Runner.Sessions.Actions.Transactions.Builders;
using QaaS.Runner.Sessions.Session.Builders;

Directory.SetCurrentDirectory(AppContext.BaseDirectory);

var runner = Bootstrap.New(NormalizeArgs(args));
var executionBuilder = runner.ExecutionBuilders.Single();

var requestData = new DataSourceBuilder()
    .Named("RequestData")
    .HookNamed(nameof(FromFileSystem))
    .Configure(new FromFileSystemConfig
    {
        DataArrangeOrder = DataArrangeOrder.AsciiAsc,
        FileSystem = new FileSystemConfig
        {
            Path = "Requests"
        }
    });

var transaction = new TransactionBuilder()
    .Named("GetServerData")
    .AddDataSource("RequestData")
    .WithTimeout(5000)
    .Configure(new HttpTransactorConfig
    {
        BaseAddress = "http://127.0.0.1",
        Method = HttpMethods.Get,
        Port = 8080,
        Route = "data"
    });

var session = new SessionBuilder()
    .Named("DummyAppSession")
    .AddTransaction(transaction);

var assertion = new AssertionBuilder
    {
        AssertionInstance = null!,
        Reporter = null!
    }
    .Named("GetServerDataReturns200")
    .HookNamed(nameof(HttpStatus))
    .AddSessionName("DummyAppSession")
    .Configure(new HttpStatusConfiguration
    {
        StatusCode = 200,
        OutputNames = ["GetServerData"]
    });

executionBuilder
    .WithMetadata(new MetaDataConfig
    {
        Team = "Smoke",
        System = "DummyApp"
    })
    .AddDataSource(requestData)
    .AddSession(session)
    .AddAssertion(assertion);

runner.Run();

static string[] NormalizeArgs(IEnumerable<string> args)
{
    var normalizedArgs = args.ToArray();
    return normalizedArgs.Length == 0 ? ["run", "test.qaas.yaml"] : normalizedArgs;
}
```

The explicit initialization of `AssertionInstance` and `Reporter` matches the current public package shape of `AssertionBuilder`.
