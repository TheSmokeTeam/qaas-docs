# execute

Executes a yaml execution file that contains a list of other commands to execute in a sequential order. The flags of all commands in the execution file that can also be given in the execute command ('s', 'e', 'l', 'g') will be ignored.

## Invocation

```bash
dotnet run <dotnet-parameters> -- execute <executable-file> [flags]
```

## Use When

- You want to orchestrate several Runner commands from a single YAML file.
- You need stable IDs for filtering, logging, and report correlation across a multi-command flow.

## Positional Arguments

| Position | Property | Source Type | Required | Default | Value Type | Description |
| -------- | -------- | ----------- | -------- | ------- | ---------- | ----------- |
| `0` | `ConfigurationFile` | `Execute options` | Yes | executable.yaml | `string` | Path to a yaml configuration file that contains a list of QaaS commands to execute in sequential order. |

## Flags

| Category | Flag | Inherited | Required | Default | Value Type | Description |
| -------- | ---- | --------- | -------- | ------- | ---------- | ----------- |
| Selection | `-c`, `--command-ids-to-run` | No | No | [] | `string list` | Ids of the commands to run. Only the commands given would run. If none is given runs all commands. |
| Logging | `--disable-elastic-defaults` | Yes | No | False | `bool` | Disables Elastic defaults registered through the runtime defaults provider for this run. |
| Logging | `--elastic-password` | Yes | No |  | `string` | Optional Elasticsearch password for the logger sink. |
| Logging | `--elastic-uri` | Yes | No |  | `string` | Elasticsearch URI used by the logger sink when send-logs is enabled. |
| Logging | `--elastic-username` | Yes | No |  | `string` | Optional Elasticsearch username for the logger sink. |
| Results | `-e`, `--empty-allure-directory` | No | No | False | `bool` | If flag is enabled will automatically empty the allure results directory before running. |
| Logging | `-g`, `--logger-configuration-file` | Yes | No |  | `string` | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag. |
| Logging | `-l`, `--logger-level` | Yes | No |  | `LogEventLevel (optional)` | The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug,<br />Information, Warning, Error, Fatal. |
| Runtime | `--no-process-exit` | No | No | False | `bool` | When this flag is used the runner will not terminate the current process after it completes. Useful when embedding QaaS.Runner and orchestrating multiple runners in a single host process. |
| Logging | `--send-logs` | Yes | No | False | `bool` | Whether to send logs to the configured Elasticsearch sink. |
| Results | `-s`, `--serve-results` | No | No |  | `string` | Serves Allure output after executing all commands.<br />If the flag is provided without a value it serves the default raw results folder 'allure-results'.<br />Provide a folder name such as 'allure-report' to open a generated report directory, which is useful for Allure 3 flows.<br />When any of the commands written in the executable configuration file use this flag it will not do anything, this is the deciding flag.<br />Uses a locally installed allure CLI tool, if allure CLI is not installed and added to path the serve will fail. |

## Executable File Format

The executable YAML contains QaaS commands, not `dotnet run` invocations:

```yaml
Commands:
  - Command: template test.qaas.yaml
    Id: preview
  - Command: run test.qaas.yaml
    Id: smoke
    Parallel: false
```

`Id` is the stable identifier used by `--command-ids-to-run`, logs, and generated report output.

## Flag Notes

### `-c`, `--command-ids-to-run`

Use one or more IDs from the executable file when you only want a subset of the declared commands to run.

### `-s`, `--serve-results`

The top-level `execute` flag decides whether results are served after the flow completes. Embedded `serve-results` flags inside the YAML commands do not take over.

## Examples

### Execute every command in the YAML file

```bash
dotnet run -- execute executable.yaml
```

### Execute only selected command IDs

```bash
dotnet run -- execute executable.yaml -c smoke assert-only
```

### Execute the flow and open the report folder

```bash
dotnet run -- execute executable.yaml -s allure-report
```

## Raw CLI Help

```text
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  -s folder, --serve-results=folder    Serves Allure output after executing all commands.
                                       If the flag is provided without a value it serves the default raw results folder
                                       'allure-results'.
                                       Provide a folder name such as 'allure-report' to open a generated report
                                       directory, which is useful for Allure 3 flows.
                                       When any of the commands written in the executable configuration file use this
                                       flag it will not do anything, this is the deciding flag.
                                       Uses a locally installed allure CLI tool, if allure CLI is not installed and
                                       added to path the serve will fail.


  -e, --empty-allure-directory         (Default: false) If flag is enabled will automatically empty the allure results
                                       directory before running.

  -c, --command-ids-to-run             Ids of the commands to run. Only the commands given would run. If none is given
                                       runs all commands.

  --no-process-exit                    (Default: false) When this flag is used the runner will not terminate the current
                                       process after it completes. Useful when embedding QaaS.Runner and orchestrating
                                       multiple runners in a single host process.

  -l, --logger-level                   The logger's level, overrides both the default logger's level (Information) and
                                       the level of any logger's configuration given.
                                       All available options (not case sensitive) are: Verbose, Debug,
                                       Information, Warning, Error, Fatal.

  -g, --logger-configuration-file      Path to a logger's configuration file, will override the default logger's
                                       configuration. Its level can be overridden by the logger-level flag.

  --send-logs                          (Default: false) Whether to send logs to the configured Elasticsearch sink.

  --elastic-uri                        Elasticsearch URI used by the logger sink when send-logs is enabled.

  --elastic-username                   Optional Elasticsearch username for the logger sink.

  --elastic-password                   Optional Elasticsearch password for the logger sink.

  --disable-elastic-defaults           (Default: false) Disables Elastic defaults registered through the runtime
                                       defaults provider for this run.

  --help                               Display this help screen.

  --version                            Display version information.

  value pos. 0                         (Default: executable.yaml) Path to a yaml configuration file that contains a list
                                       of QaaS commands to execute in sequential order.

No-args guidance:
  Empty arguments only work for code-only hosts that choose a no-args path in Program.cs.
  If a YAML file is part of the scenario, pass it explicitly: dotnet run -- run <config-file>.
```
