# Debug Test Failure

## QaaS Logs

QaaS includes a configurable logger that can output logs to the console or to a file. The log level can be adjusted using the `-l` flag, or the entire logging configuration can be overridden using the `-g` flag.

For more information about the logger, refer to the [Logger documentation](../userInterfaces/logger.md).

## QaaS Act/Assert Commands

QaaS provides two specialized commands to help debug test failures:

- `act`: Runs only the `act` phase of the test, which includes DataSources and Sessions. The output is stored in an external storage location.
- `assert`: Runs only the `assert` phase of the test, which includes DataSources and Assertions. It retrieves required data from the same external storage.

Both commands use the configuration defined in the [Storages](../userInterfaces/runner/configurationSections/storages/overview.md) section to access the external storage.

These commands are particularly useful for:

- Debugging assertion configurations
- Using QaaS solely as a data injector for testing or validation

### Usage Examples

To run only the `act` phase and store output in a specified directory:

```bash
dotnet run -- act test.qaas.yaml -w Variables/...
```

To run only the `assert` phase using previously stored data:

```bash
dotnet run -- assert test.qaas.yaml -w Variables/...
```

This workflow allows you to isolate and inspect each phase of the test independently, making it easier to identify and resolve issues.