# Execute

The `execute` command runs a list of QaaS commands from a separate execution YAML file. It is useful when a workflow needs more than one runner command in a fixed order.

!!! note
    Every command in the execution file must have a unique `Id`. That ID is used in logs and result output to make it clear which command produced which data.

## Usage

```bash
dotnet run -- execute <execution-file> [shared-logging-options] [execute-options]
```

To see the generated help text from the runner itself:

```bash
dotnet run -- execute --help
```

## Execute-Specific Options

| Flag | Purpose |
|---|---|
| `-s`, `--serve-results` | Serve Allure results after the full execution file completes. |
| `-e`, `--empty-allure-directory` | Empty the Allure results directory before execution starts. |
| `-c`, `--command-ids-to-run` | Run only selected command IDs from the execution file. |

## Configuration

The YAML stores QaaS commands only. Do not include `dotnet run --`.

### YAML View

```yaml
Commands:
  - Command:
    Id:
```

### Table View

| Property Path | Type | Required | Description |
|---|---|---|---|
| `Commands` | `array` (`length >= 1`) | yes | Commands to run, in the order they should run. |
| `Commands[]` | `object` | yes | A single command entry. |
| `Commands[].Command` | `string` | yes | The QaaS command to execute, for example `run test.qaas.yaml -s`. |
| `Commands[].Id` | `string` (`1..100` chars) | yes | Stable identifier used in logs and result output. |

The current source code does not support a `Parallel` field on execute commands. If you see that field in older examples, treat it as outdated.
