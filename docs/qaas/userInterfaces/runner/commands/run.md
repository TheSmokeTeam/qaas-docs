# run

The `run` command executes a full QaaS test — sessions (act) followed by assertions — according to the given configuration files.

## Usage

To view all command options, execute the following command:

```bash
dotnet run <dotnet-parameters> -- run --help
```

This command will display all available options for the run command, including flags and values.

## Embedded Hosts

Use `--no-process-exit` when the runner is hosted inside a larger application and should return control to the caller instead of terminating the process:

```bash
dotnet run <dotnet-parameters> -- run test.qaas.yaml --no-process-exit
```

In this mode `Run()` does not call `Environment.Exit(...)`. For multi-runner orchestration, prefer `RunAndGetExitCode()` and aggregate the results in the outer host.
