# Create a Mock (Code)

Use code configuration when the mock should be assembled with normal C# builders instead of one static YAML file. The runtime concepts stay the same as the YAML guide: a data source feeds a stub, and a server action points to that stub.

The completed sample is available in the `code_configuration` branch of [DummyAppMock]({{ links.repository_mocker_quickstart }}/tree/code_configuration).

## Add the Response File

`DummyAppMock/ServerData/sample.json`

```json
{
  "message": "hello from DummyAppMock",
  "source": "code_configuration"
}
```

## Reuse the Same Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start.

## Keep `mocker.qaas.yaml` Empty

`DummyAppMock/mocker.qaas.yaml`

```yaml
# Intentionally blank. Program.cs builds the mock definition after bootstrap loads this file.
```

Mocker still expects the standard configuration-file argument, so the code sample keeps an empty file in place and then updates the loaded execution builder in `Program.cs`.

## Build the Mock in `Program.cs`

`DummyAppMock/Program.cs`

```csharp
using DummyAppMock.Processors;
using System.Reflection;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;

var runner = Bootstrap.New(args);
var executionBuilder = GetExecutionBuilder(runner);

executionBuilder.CreateDataSource(new DataSourceBuilder()
    .Named("ServerData")
    .HookNamed(nameof(FromFileSystem))
    .Configure(new FromFileSystemConfig
    {
        DataArrangeOrder = DataArrangeOrder.AsciiAsc,
        FileSystem = new FileSystemConfig
        {
            Path = Path.Combine(AppContext.BaseDirectory, "ServerData")
        }
    }));

executionBuilder.CreateStub(new TransactionStubBuilder()
    .Named("ServerDataStub")
    .HookNamed(nameof(ServerDataProcessor))
    .AddDataSourceName("ServerData"));

executionBuilder.ReplaceServers(
    new ServerConfig
    {
        Http = new HttpServerConfig
        {
            Port = 8080,
            IsLocalhost = false,
            Endpoints =
            [
                new HttpEndpointConfig
                {
                    Path = "/data",
                    Actions =
                    [
                        new HttpEndpointActionConfig
                        {
                            Name = "GetServerData",
                            Method = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod.Get,
                            TransactionStubName = "ServerDataStub"
                        }
                    ]
                }
            ]
        }
    });

runner.Run();

static ExecutionBuilder GetExecutionBuilder(MockerRunner runner)
{
    return typeof(MockerRunner)
        .GetField("_executionBuilder", BindingFlags.Instance | BindingFlags.NonPublic)?
        .GetValue(runner) as ExecutionBuilder
        ?? throw new InvalidOperationException("Mocker execution builder was not initialized.");
}
```

This keeps the runtime behavior aligned with the YAML guide:

- `Bootstrap.New(...)` keeps the normal Mocker startup path and CLI parsing intact.
- `GetExecutionBuilder(...)` retrieves the builder that bootstrap loaded from `mocker.qaas.yaml`, so `Program.cs` can extend it step by step.
- The rest of `Program.cs` adds the same data source, stub, and server configuration shown in the YAML guide.

## Run

From `DummyAppMock/DummyAppMock`:

```bash
dotnet run -- run mocker.qaas.yaml --no-env
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```

The mock keeps running after the check. Stop it with `Ctrl+C` when you are done.
