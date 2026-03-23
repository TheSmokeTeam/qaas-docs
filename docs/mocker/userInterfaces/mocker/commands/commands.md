<!-- generated hash:7a1e2cb8c7a1 sources:Mocker, cli-overview -->

# Commands

This page is generated from a committed Mocker CLI snapshot captured from the live help path.

Running without a command currently prints:

```text
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  run         Start the configured mock servers and optional controller runtime.

  template    Render the effective merged configuration after file, folder, argument, and environment overrides.

  help        Display more information on a specific command.

  version     Display version information.

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

  --send-logs                        (Default: false) Weather to send the logs to Smokes's logs database

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

  --send-logs                        (Default: false) Weather to send the logs to Smokes's logs database

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

## Available Commands

| Command | Description |
| ------- | ----------- |
| `run` | Start the configured mock servers and optional controller runtime. |
| `template` | Render the effective merged configuration after file, folder, argument, and environment overrides. |

## Common Flags

| Flag | Required | Default | Type | Description |
| ---- | -------- | ------- | ---- | ----------- |
| `--disable-elastic-defaults` | No | False | `bool` | Disables Elastic defaults registered through the runtime defaults provider for this run. |
| `--elastic-password` | No |  | `string` | Optional Elasticsearch password for the logger sink. |
| `--elastic-uri` | No |  | `string` | Elasticsearch URI used by the logger sink when send-logs is enabled. |
| `--elastic-username` | No |  | `string` | Optional Elasticsearch username for the logger sink. |
| `-g`, `--logger-configuration-file` | No |  | `string` | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag. |
| `-l`, `--logger-level` | No |  | `LogEventLevel?` | The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug,<br />Information, Warning, Error, Fatal. |
| `--no-env` | No | False | `bool` | When this flag is used environment variables will not override loaded configurations. |
| `-o`, `--output-folder` | No |  | `string` | Path to a folder to write the generated templates in. |
| `-r`, `--overwrite-arguments` | No | [] | `IList<string>` | List of arguments to overwrite the mocker configuration with, The first argument overwrites the<br />mocker configuration and then the one after it overwrites the result and so on...<br />For example: `Path:To:Variable:To:Overwrite=NewVariableValue` |
| `-w`, `--overwrite-files` | No | [] | `IList<string>` | List of files to overwrite the mocker configuration with, The first file overwrites the mocker<br />configuration file and then the one after it overwrite the result and so on... |
| `-f`, `--overwrite-folders` | No | [] | `IList<string>` | List of folders whose yaml files overwrite the mocker configuration in alphabetical order,<br />after overwrite files and in the order the folders are given. |
| `--run-locally` | No | False | `bool` | Runs the project locally and enables exit by any key press. |
| `--send-logs` | No | False | `bool` | Weather to send the logs to Smokes's logs database |
