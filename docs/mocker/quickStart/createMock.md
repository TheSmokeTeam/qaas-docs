# Create a Mock

The fastest way to start is the `qaas-mocker` template. After the template pack is installed:

```bash
dotnet new qaas-mocker -n MyCompany.QaaS.Mocker
```

## What the Template Gives You

The generated project starts with:

- a `Program.cs` entry point that sets the working directory to the app base directory and adds `--no-env` unless you pass it explicitly
- a default `mocker.qaas.yaml`
- a minimal HTTP `/health` action backed by `StatusCodeTransactionProcessor` from `QaaS.Common.Processors`
- a `Dockerfile`, `NuGet.config`, and GitHub Actions workflow

The default configuration looks like this:

```yaml
DataSources: []

Stubs:
  - Name: HealthStub
    Processor: StatusCodeTransactionProcessor
    ProcessorSpecificConfiguration:
      StatusCode: 200

Server:
  Type: Http
  Http:
    Port: 8080
    IsLocalhost: false
    Endpoints:
      - Path: /health
        Actions:
          - Name: HealthAction
            Method: Get
            TransactionStubName: HealthStub
```

## Extend the Mock

- Add `DataSources` when a processor or socket broadcast action needs generated input.
- Add `Stubs` to bind names to `ITransactionProcessor` hooks and optional processor-specific configuration.
- Point server actions to stubs with `TransactionStubName`.
- Use `Server` for one runtime or `Servers` to start several runtimes from the same process.
- Add `Controller` only when Runner tests need runtime mocker commands.

## Custom Processors

Transaction stubs are backed by `ITransactionProcessor`. You can:

- reference processors from companion packages such as `QaaS.Common.Processors`
- implement a processor in the mock project and reference it by class name

## Run the Generated Mock

1. From the generated solution root, restore with the generated package sources:

```bash
dotnet restore --configfile NuGet.config
```

2. Open the generated project folder that contains `Program.cs` and `mocker.qaas.yaml`.
3. Start the mock:

```bash
dotnet run -- run mocker.qaas.yaml
```

Then call the default health endpoint. The template configuration returns HTTP `200`.

```bash
curl -i http://localhost:8080/health
```

The same entry point also supports:

```bash
dotnet run -- lint mocker.qaas.yaml
dotnet run -- template mocker.qaas.yaml
```
