# run

The `run` command starts the configured QaaS Mocker runtime.

## Usage

```bash
dotnet run -- run mocker.qaas.yaml
```

Common variations:

```bash
dotnet run -- run mocker.qaas.yaml --overwrite-files mocker.local.qaas.yaml
dotnet run -- run mocker.qaas.yaml --overwrite-arguments "Servers:0:Http:Port=8080"
dotnet run -- run mocker.qaas.yaml --no-env --run-locally
```

Use `dotnet run -- run --help` to see the full option list.
