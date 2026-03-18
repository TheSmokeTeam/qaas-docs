# act

The `act` command runs only the session phase of a QaaS test (according to the given configuration) and writes the resulting `SessionData` to the configured [Storages](../configurationSections/storages/overview.md). Use this in combination with [`assert`](assert.md) to debug failures.

## Usage

To view all command options, execute the following command:

```bash
dotnet run <dotnet-parameters> -- act --help
```

This command will display all available options for the act command, including flags and values.
