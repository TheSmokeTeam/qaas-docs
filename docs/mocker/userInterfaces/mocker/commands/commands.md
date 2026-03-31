# Commands

QaaS Mocker exposes a compact command surface: one command to start the runtime and one command to render the effective configuration without starting it.

## Invocation Pattern

```bash
dotnet run <dotnet-parameters> -- <command> [command-values] [command-flags]
```

## Available Commands

| Command | Description | Best For |
| ------- | ----------- | -------- |
| [`run`](./run.md) | Start the configured mock servers and optional controller runtime. | Start the configured mock servers and optional controller runtime. |
| [`template`](./template.md) | Render the effective merged configuration after file, folder, argument, and environment overrides. | Render the effective merged mocker configuration without starting the runtime. |

## Common Flags

| Category | Flag | Default | Type | Description |
| -------- | ---- | ------- | ---- | ----------- |
| Logging | `--disable-elastic-defaults` | False | `bool` | Disables Elastic defaults registered through the runtime defaults provider for this run. |
| Logging | `--elastic-password` |  | `string` | Optional Elasticsearch password for the logger sink. |
| Logging | `--elastic-uri` |  | `string` | Elasticsearch URI used by the logger sink when send-logs is enabled. |
| Logging | `--elastic-username` |  | `string` | Optional Elasticsearch username for the logger sink. |
| Logging | `-g`, `--logger-configuration-file` |  | `string` | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag. |
| Logging | `-l`, `--logger-level` |  | `LogEventLevel (optional)` | The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug,<br />Information, Warning, Error, Fatal. |
| Configuration | `--no-env` | False | `bool` | When this flag is used environment variables will not override loaded configurations. |
| Output | `-o`, `--output-folder` |  | `string` | Path to a folder to write the generated templates in. |
| Configuration | `-r`, `--overwrite-arguments` | [] | `string list` | List of arguments to overwrite the mocker configuration with, The first argument overwrites the<br />mocker configuration and then the one after it overwrites the result and so on...<br />For example: `Path:To:Variable:To:Overwrite=NewVariableValue` |
| Configuration | `-w`, `--overwrite-files` | [] | `string list` | List of files to overwrite the mocker configuration with, The first file overwrites the mocker<br />configuration file and then the one after it overwrite the result and so on... |
| Configuration | `-f`, `--overwrite-folders` | [] | `string list` | List of folders whose yaml files overwrite the mocker configuration in alphabetical order,<br />after overwrite files and in the order the folders are given. |
| Runtime | `--run-locally` | False | `bool` | Runs the project locally and enables exit by any key press. |
| Logging | `--send-logs` | False | `bool` | Whether to send logs to the configured Elasticsearch sink. |

## Working Style

- Use `template` when you want to verify the final merged configuration before you boot the runtime.
- Use `run` when you are ready to start the configured mock servers and optional controller process.

## Raw CLI Help

```text
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  run         Start the configured mock servers and optional controller runtime.

  template    Render the effective merged configuration after file, folder, argument, and environment overrides.

  help        Display more information on a specific command.

  version     Display version information.

No-args guidance:
  Empty arguments only work for code-only hosts that choose a no-args path in Program.cs.
  If a YAML file is part of the scenario, pass it explicitly: dotnet run -- run <config-file>.

Command Details:

run:
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  -w, --overwrite-files              List of files to overwrite the mocker configuration with, The first file overwrites
                                     the mocker
                                     configuration file and then the one after it overwrite the result and so on...

  -f, --overwrite-folders            List of folders whose yaml files overwrite the mocker configuration in alphabetical
                                     order,
                                     after overwrite files and in the order the folders are given.

  -r, --overwrite-arguments          List of arguments to overwrite the mocker configuration with, The first argument
                                     overwrites the
                                     mocker configuration and then the one after it overwrites the result and so on...
                                     For example: `Path:To:Variable:To:Overwrite=NewVariableValue`

  --no-env                           (Default: false) When this flag is used environment variables will not override
                                     loaded configurations.

  -o, --output-folder                Path to a folder to write the generated templates in.

  --run-locally                      (Default: false) Runs the project locally and enables exit by any key press.

  -l, --logger-level                 The logger's level, overrides both the default logger's level (Information) and the
                                     level of any logger's configuration given.
                                     All available options (not case sensitive) are: Verbose, Debug,
                                     Information, Warning, Error, Fatal.

  -g, --logger-configuration-file    Path to a logger's configuration file, will override the default logger's
                                     configuration. Its level can be overridden by the logger-level flag.

  --send-logs                        (Default: false) Whether to send logs to the configured Elasticsearch sink.

  --elastic-uri                      Elasticsearch URI used by the logger sink when send-logs is enabled.

  --elastic-username                 Optional Elasticsearch username for the logger sink.

  --elastic-password                 Optional Elasticsearch password for the logger sink.

  --disable-elastic-defaults         (Default: false) Disables Elastic defaults registered through the runtime defaults
                                     provider for this run.

  --help                             Display this help screen.

  --version                          Display version information.

  value pos. 0                       (Default: mocker.qaas.yaml) Path to a mocker yaml configuration file to use with
                                     the command.

template:
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  -w, --overwrite-files              List of files to overwrite the mocker configuration with, The first file overwrites
                                     the mocker
                                     configuration file and then the one after it overwrite the result and so on...

  -f, --overwrite-folders            List of folders whose yaml files overwrite the mocker configuration in alphabetical
                                     order,
                                     after overwrite files and in the order the folders are given.

  -r, --overwrite-arguments          List of arguments to overwrite the mocker configuration with, The first argument
                                     overwrites the
                                     mocker configuration and then the one after it overwrites the result and so on...
                                     For example: `Path:To:Variable:To:Overwrite=NewVariableValue`

  --no-env                           (Default: false) When this flag is used environment variables will not override
                                     loaded configurations.

  -o, --output-folder                Path to a folder to write the generated templates in.

  --run-locally                      (Default: false) Runs the project locally and enables exit by any key press.

  -l, --logger-level                 The logger's level, overrides both the default logger's level (Information) and the
                                     level of any logger's configuration given.
                                     All available options (not case sensitive) are: Verbose, Debug,
                                     Information, Warning, Error, Fatal.

  -g, --logger-configuration-file    Path to a logger's configuration file, will override the default logger's
                                     configuration. Its level can be overridden by the logger-level flag.

  --send-logs                        (Default: false) Whether to send logs to the configured Elasticsearch sink.

  --elastic-uri                      Elasticsearch URI used by the logger sink when send-logs is enabled.

  --elastic-username                 Optional Elasticsearch username for the logger sink.

  --elastic-password                 Optional Elasticsearch password for the logger sink.

  --disable-elastic-defaults         (Default: false) Disables Elastic defaults registered through the runtime defaults
                                     provider for this run.

  --help                             Display this help screen.

  --version                          Display version information.

  value pos. 0                       (Default: mocker.qaas.yaml) Path to a mocker yaml configuration file to use with
                                     the command.
```
