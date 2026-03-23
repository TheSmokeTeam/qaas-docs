<!-- generated hash:e0272afc9b49 sources:Runner, execute, cli-command -->

# execute

Executes a yaml execution file that contains a list of other commands to execute in a sequential order. The flags of all commands in the execution file that can also be given in the execute command ('s', 'e', 'l', 'g') will be ignored.

## Help Output

```text
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  -s, --serve-results                (Default: false)
                                     If flag is enabled will automatically serve the test results in a human readable
                                     manner using allure after executing all commands.
                                     when any of the commands written in the executable configuration file use this flag
                                     it will not do anything, this is the deciding flag.
                                     Uses a locally installed allure CLI tool, if allure CLI is not installed and added
                                     to path the serve will fail.


  -e, --empty-allure-directory       (Default: false) If flag is enabled will automatically empty the allure results
                                     directory before running.

  -c, --command-ids-to-run           Ids of the commands to run. Only the commands given would run. If none is given
                                     runs all commands.

  --no-process-exit                  (Default: false) When this flag is used the runner will not terminate the current
                                     process after it completes. Useful when embedding QaaS.Runner and orchestrating
                                     multiple runners in a single host process.

  -l, --logger-level                 The logger's level, overrides both the default logger's level (Information) and the
                                     level of any logger's configuration given.
                                     All available options (not case sensitive) are: Verbose, Debug,
                                     Information, Warning, Error, Fatal.

  -g, --logger-configuration-file    Path to a logger's configuration file, will override the default logger's
                                     configuration. Its level can be overridden by the logger-level flag.

  --send-logs                        (Default: false) Whether to send the logs to Smoke's logs database

  --elastic-uri                      Elasticsearch URI used by the logger sink when send-logs is enabled.

  --elastic-username                 Optional Elasticsearch username for the logger sink.

  --elastic-password                 Optional Elasticsearch password for the logger sink.

  --disable-elastic-defaults         (Default: false) Disables Elastic defaults registered through the runtime defaults
                                     provider for this run.

  --help                             Display this help screen.

  --version                          Display version information.

  value pos. 0                       (Default: executable.yaml) Path to a yaml configuration file that contains a list
                                     of QaaS commands to execute in sequential order.
```

## Positional Arguments

| Position | Property | Source Type | Required | Default | Value Type | Description |
| -------- | -------- | ----------- | -------- | ------- | ---------- | ----------- |
| `0` | `ConfigurationFile` | `Execute options` | Yes | executable.yaml | `string` | Path to a yaml configuration file that contains a list of QaaS commands to execute in sequential order. |

## Flags

| Flag | Property | Source Type | Inherited | Required | Default | Value Type | Description |
| ---- | -------- | ----------- | --------- | -------- | ------- | ---------- | ----------- |
| `-c`, `--command-ids-to-run` | `CommandIdsToRun` | `Execute options` | No | No | [] | `string list` | Ids of the commands to run. Only the commands given would run. If none is given runs all commands. |
| `--disable-elastic-defaults` | `DisableElasticDefaults` | `Logger options` | Yes | No | False | `bool` | Disables Elastic defaults registered through the runtime defaults provider for this run. |
| `--elastic-password` | `ElasticPassword` | `Logger options` | Yes | No |  | `string` | Optional Elasticsearch password for the logger sink. |
| `--elastic-uri` | `ElasticUri` | `Logger options` | Yes | No |  | `string` | Elasticsearch URI used by the logger sink when send-logs is enabled. |
| `--elastic-username` | `ElasticUsername` | `Logger options` | Yes | No |  | `string` | Optional Elasticsearch username for the logger sink. |
| `-e`, `--empty-allure-directory` | `EmptyAllureDirectory` | `Execute options` | No | No | False | `bool` | If flag is enabled will automatically empty the allure results directory before running. |
| `-g`, `--logger-configuration-file` | `LoggerConfigurationFilePath` | `Logger options` | Yes | No |  | `string` | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag. |
| `-l`, `--logger-level` | `LoggerLevel` | `Logger options` | Yes | No |  | `LogEventLevel (optional)` | The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug,<br />Information, Warning, Error, Fatal. |
| `--no-process-exit` | `NoProcessExit` | `Execute options` | No | No | False | `bool` | When this flag is used the runner will not terminate the current process after it completes. Useful when embedding QaaS.Runner and orchestrating multiple runners in a single host process. |
| `--send-logs` | `SendLogs` | `Logger options` | Yes | No | False | `bool` | Whether to send the logs to Smoke's logs database |
| `-s`, `--serve-results` | `AutoServeTestResults` | `Execute options` | No | No | False | `bool` | If flag is enabled will automatically serve the test results in a human readable manner using allure after executing all commands.<br />when any of the commands written in the executable configuration file use this flag it will not do anything, this is the deciding flag.<br />Uses a locally installed allure CLI tool, if allure CLI is not installed and added to path the serve will fail. |
