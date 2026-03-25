# Create a Mock (Code)

Use code configuration when the mock should be assembled with normal C# builders instead of one static YAML file. In the current contract, empty program arguments are reserved for code-only hosts. If a default YAML file is also present, you must pass arguments explicitly.

- `dotnet run` uses the code-defined mock in `Program.cs`
- `dotnet run -- template` prints the YAML-equivalent shape of the code-defined mock so you can diff it against the YAML sample

The completed sample is available at [DummyAppMock (Code)]({{ links.repository_mocker_quickstart_code }}).

## Create the Project

```bash
dotnet new qaas-mocker -n DummyAppMock
cd DummyAppMock
dotnet add DummyAppMock/DummyAppMock.csproj package QaaS.Mocker --version 2.0.5
dotnet add DummyAppMock/DummyAppMock.csproj package QaaS.Common.Generators --version 3.1.2
```

The direct code-built HTTP server sample shown below currently relies on the published public package combination above.

## Keep the Host Code-Only

No-args startup is only valid when this host is code-only. Do not keep a default `mocker.qaas.yaml` next to this sample if you want `dotnet run` with no extra arguments to execute the code path.

`DummyAppMock/Properties/launchSettings.json`

```json
{
  "$schema": "http://json.schemastore.org/launchsettings.json",
  "profiles": {
    "QaaS Mocker": {
      "commandName": "Project"
    }
  }
}
```

## Add the Response File

`DummyAppMock/ServerData/sample.json`

```json
{
  "message": "hello from DummyAppMock",
  "source": "dummy_app_mock"
}
```

## Reuse the Same Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start.

## Replace `Program.cs`

`DummyAppMock/Program.cs`

```csharp
using DummyAppMock.Processors;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;

if (ShouldUseCodeConfiguration(args, out var executionMode))
{
    if (executionMode == CodeExecutionMode.Template)
    {
        RenderCodeTemplate(args);
        return;
    }

    new MockerRunner(CreateCodeExecutionBuilder()).Run();
    return;
}

Bootstrap.New(NormalizeYamlArguments(args)).Run();

return;

static bool ShouldUseCodeConfiguration(string[] args, out CodeExecutionMode executionMode)
{
    if (args.Any(IsHelpOrVersionOption))
    {
        executionMode = default;
        return false;
    }

    if (args.Length == 0)
    {
        if (HasDefaultYamlConfiguration())
        {
            executionMode = default;
            return false;
        }

        executionMode = CodeExecutionMode.Run;
        return true;
    }

    if (args[0].Equals("template", StringComparison.OrdinalIgnoreCase) && !HasExplicitTemplateConfigurationPath(args))
    {
        executionMode = CodeExecutionMode.Template;
        return true;
    }

    executionMode = default;
    return false;
}

static ExecutionBuilder CreateCodeExecutionBuilder()
{
    return new ExecutionBuilder()
        .CreateDataSource(new DataSourceBuilder()
            .Named("ServerData")
            .HookNamed(nameof(FromFileSystem))
            .Configure(new FromFileSystemConfig
            {
                DataArrangeOrder = DataArrangeOrder.AsciiAsc,
                FileSystem = new FileSystemConfig
                {
                    Path = Path.Combine(AppContext.BaseDirectory, "ServerData")
                }
            }))
        .CreateStub(new TransactionStubBuilder()
            .Named("ServerDataStub")
            .HookNamed(nameof(ServerDataProcessor))
            .AddDataSourceName("ServerData"))
        .ReplaceServers(
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
}

static void RenderCodeTemplate(IReadOnlyList<string> args)
{
    var template = """
DataSources:
  - Name: ServerData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: ServerData

Stubs:
  - Name: ServerDataStub
    Processor: ServerDataProcessor
    DataSourceNames: [ServerData]

Servers:
  - Http:
      Port: 8080
      IsLocalhost: false
      Endpoints:
        - Path: /data
          Actions:
            - Name: GetServerData
              Method: Get
              TransactionStubName: ServerDataStub
""";

    var outputFolder = GetTemplateOutputFolder(args);
    if (string.IsNullOrWhiteSpace(outputFolder))
    {
        Console.WriteLine(template);
        return;
    }

    Directory.CreateDirectory(outputFolder);
    File.WriteAllText(Path.Combine(outputFolder, "template.qaas.yaml"), template + Environment.NewLine);
}

static bool HasDefaultYamlConfiguration()
{
    return File.Exists(Path.Combine(AppContext.BaseDirectory, "mocker.qaas.yaml"));
}

static string[] NormalizeYamlArguments(string[] args)
{
    if (args.Length == 1 && LooksLikeConfigurationPath(args[0]))
        return ["run", args[0]];

    return args;
}

static bool HasExplicitTemplateConfigurationPath(IReadOnlyList<string> args)
{
    return args.Count > 1 && !args[1].StartsWith("-", StringComparison.Ordinal);
}

static string? GetTemplateOutputFolder(IReadOnlyList<string> args)
{
    for (var index = 1; index < args.Count; index++)
    {
        var argument = args[index];
        if ((argument.Equals("-o", StringComparison.OrdinalIgnoreCase) ||
             argument.Equals("--output-folder", StringComparison.OrdinalIgnoreCase)) &&
            index + 1 < args.Count)
        {
            return args[index + 1];
        }

        const string shortPrefix = "-o=";
        const string longPrefix = "--output-folder=";

        if (argument.StartsWith(shortPrefix, StringComparison.OrdinalIgnoreCase))
            return argument[shortPrefix.Length..];
        if (argument.StartsWith(longPrefix, StringComparison.OrdinalIgnoreCase))
            return argument[longPrefix.Length..];
    }

    return null;
}

static bool IsHelpOrVersionOption(string argument)
{
    return argument.Equals("--help", StringComparison.OrdinalIgnoreCase) ||
           argument.Equals("-h", StringComparison.OrdinalIgnoreCase) ||
           argument.Equals("--version", StringComparison.OrdinalIgnoreCase);
}

static bool LooksLikeConfigurationPath(string argument)
{
    if (argument.StartsWith("-", StringComparison.Ordinal))
        return false;

    if (Path.IsPathRooted(argument))
        return true;

    if (argument.IndexOfAny(['\\', '/']) >= 0)
        return true;

    var extension = Path.GetExtension(argument);
    return extension.Equals(".yaml", StringComparison.OrdinalIgnoreCase) ||
           extension.Equals(".yml", StringComparison.OrdinalIgnoreCase);
}

enum CodeExecutionMode
{
    Run,
    Template
}
```

The host keeps two entry points:

- no args: build the mock in code and run it
- `template` with no file: print the YAML-equivalent shape of that code-defined mock

If you later add a default YAML file to the same host, stop relying on the no-args path and pass the YAML explicitly instead.

## Run the Code Path

From `DummyAppMock/DummyAppMock`:

```bash
dotnet run
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```

## Validate That the Code Path Matches YAML

```bash
dotnet run -- template
```

That output should match the authored `mocker.qaas.yaml` shape shown above.

The mock keeps running after the check. Stop it with `Ctrl+C` when you are done.
