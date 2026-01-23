# Assert

The assert command is used to execute the `assert` part of a QaaS test according to the given configuration files. This command executes the sections relevant to the `assert` parts of the test defined in the QaaS configuration files, it retrieves the data to assert on from the configured [Storages](../configurationSections/storages/overview.md).

## Usage

To view all command options, execute the following command:

```bash
dotnet run <dotnet-parameters> -- assert --help
```

This command will display all available options for the assert command, including flags and values.
