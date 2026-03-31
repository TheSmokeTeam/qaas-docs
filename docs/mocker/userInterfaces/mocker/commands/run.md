# run

Start the configured mock servers and optional controller runtime.

## Invocation

```bash
dotnet run <dotnet-parameters> -- run <config-file> [flags]
```

## Use When

- You want to boot the mock environment from a committed mocker YAML file.
- You need to layer temporary overrides before starting the servers.
- You want a local interactive host by combining the command with `--run-locally`.

## Positional Arguments

| Position | Property | Source Type | Inherited | Required | Default | Value Type | Description |
| -------- | -------- | ----------- | --------- | -------- | ------- | ---------- | ----------- |
| `0` | `ConfigurationFile` | `Mocker options` | Yes | Yes | mocker.qaas.yaml | `string` | Path to a mocker yaml configuration file to use with the command. |

## Flags

| Category | Flag | Inherited | Required | Default | Value Type | Description |
| -------- | ---- | --------- | -------- | ------- | ---------- | ----------- |
| Logging | `--disable-elastic-defaults` | Yes | No | False | `bool` | Disables Elastic defaults registered through the runtime defaults provider for this run. |
| Logging | `--elastic-password` | Yes | No |  | `string` | Optional Elasticsearch password for the logger sink. |
| Logging | `--elastic-uri` | Yes | No |  | `string` | Elasticsearch URI used by the logger sink when send-logs is enabled. |
| Logging | `--elastic-username` | Yes | No |  | `string` | Optional Elasticsearch username for the logger sink. |
| Logging | `-g`, `--logger-configuration-file` | Yes | No |  | `string` | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag. |
| Logging | `-l`, `--logger-level` | Yes | No |  | `LogEventLevel (optional)` | The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug,<br />Information, Warning, Error, Fatal. |
| Configuration | `--no-env` | Yes | No | False | `bool` | When this flag is used environment variables will not override loaded configurations. |
| Output | `-o`, `--output-folder` | Yes | No |  | `string` | Path to a folder to write the generated templates in. |
| Configuration | `-r`, `--overwrite-arguments` | Yes | No | [] | `string list` | List of arguments to overwrite the mocker configuration with, The first argument overwrites the<br />mocker configuration and then the one after it overwrites the result and so on...<br />For example: `Path:To:Variable:To:Overwrite=NewVariableValue` |
| Configuration | `-w`, `--overwrite-files` | Yes | No | [] | `string list` | List of files to overwrite the mocker configuration with, The first file overwrites the mocker<br />configuration file and then the one after it overwrite the result and so on... |
| Configuration | `-f`, `--overwrite-folders` | Yes | No | [] | `string list` | List of folders whose yaml files overwrite the mocker configuration in alphabetical order,<br />after overwrite files and in the order the folders are given. |
| Runtime | `--run-locally` | Yes | No | False | `bool` | Runs the project locally and enables exit by any key press. |
| Logging | `--send-logs` | Yes | No | False | `bool` | Whether to send logs to the configured Elasticsearch sink. |

## Flag Notes

### `-r`, `--overwrite-arguments`

```text
-r Server:Port=8081
```

### `--run-locally`

Use this when you want the host process to keep the mock runtime attached to the current console session.

## Examples

### Start the mocker with the default configuration

```bash
dotnet run -- run mocker.qaas.yaml
```

### Start the mocker with local overrides

```bash
dotnet run -- run mocker.qaas.yaml -w local-overrides.yaml -r Server:Port=8081
```

### Run locally and keep the host interactive

```bash
dotnet run -- run mocker.qaas.yaml --run-locally
```

## Raw CLI Help

```text
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

No-args guidance:
  Empty arguments only work for code-only hosts that choose a no-args path in Program.cs.
  If a YAML file is part of the scenario, pass it explicitly: dotnet run -- run <config-file>.
```
