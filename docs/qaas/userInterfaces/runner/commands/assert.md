# assert

The `assert` command runs only the assertion phase using existing `SessionData` retrieved from the configured [Storages](../configurationSections/storages/overview.md). Pair with [`act`](act.md) for iterative debugging.

## Usage

To view all command options, execute the following command:

```bash
dotnet run <dotnet-parameters> -- assert --help
```

This command will display all available options for the assert command, including flags and values.

## Embedded Hosts

Use `--no-process-exit` when `assert` should finish and return control to an outer orchestrator:

```bash
dotnet run <dotnet-parameters> -- assert test.qaas.yaml --no-process-exit
```

This is useful when you want to combine several runners in one host process and publish one final aggregated exit code at the end.
