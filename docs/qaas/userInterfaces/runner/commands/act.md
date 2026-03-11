# act

The `act` command runs only the session phase of a QaaS test and writes the resulting `SessionData` to the configured [Storages](../configurationSections/storages/overview.md). Use this in combination with [`assert`](assert.md) to debug failures.

## Usage

To view all command options, execute the following command:

```bash
dotnet run <dotnet-parameters> -- act --help
```

This command will display all available options for the act command, including flags and values.

## Embedded Hosts

Use `--no-process-exit` when `act` is orchestrated by another process or when several runners must run sequentially in the same application:

```bash
dotnet run <dotnet-parameters> -- act test.qaas.yaml --no-process-exit
```

For in-process orchestration, prefer `RunAndGetExitCode()` so the outer host can decide the final process exit code.
