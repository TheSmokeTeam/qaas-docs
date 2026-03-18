# assert

The `assert` command runs only the assertion phase of a QaaS test (according to the given configuration) using existing `SessionData` retrieved from the configured [Storages](../configurationSections/storages/overview.md). Pair with [`act`](act.md) for iterative debugging.

## Usage

To view all command options, execute the following command:

```bash
dotnet run <dotnet-parameters> -- assert --help
```

This command will display all available options for the assert command, including flags and values.
