# execute

The `execute` command runs multiple [Runner commands](commands.md) sequentially within a single test execution.

!!! Note
    When running QaaS Runner Commands using the execute command, each QaaS Runner Command
    will receive an ID that will be used to identify it in the logs and allure-results.

## Configurations

The `execute` command uses a YAML configuration file to know which commands to run.

!!! warning "⚠️ Important"
    The commands in the YAML file are `QaaS Commands` there is **no** need to use **dotnet run** in them.

### YAML View

```yaml
Commands:
  - Command:
    Id:
    Parallel:
```

### Table View

| Property Path         | Type                                | Required | Default | Description                                                                                                                        |
|:----------------------|:------------------------------------|:---------|:--------|:-----------------------------------------------------------------------------------------------------------------------------------|
| `Commands`            | `array`  (`length` >= `1`)          | &#10004  |         | The list of QaaS commands to execute in the order they will be executed                                                            |
| `Commands[]`          | `object`                            | &#10004  |         |                                                                                                                                    |
| `Commands[].Command`  | `string`                            | &#10004  |         | The QaaS command to execute                                                                                                        |
| `Commands[].Id`       | `string` (`100` >= `length` >= `1`) | &#10004  |         | A unique identifier to identify the command by                                                                                     |
| `Commands[].Parallel` | `boolean`                           | &#10006  | false   | Whether to run this command in parallel with other commands coming before and after it that are also set to run in parallel or not |

---

### Example

```yaml
Commands:
  - Command: template test.qaas.yaml
    Id: 1
  - Command: run test.qaas.yaml
    Id: 2
```

!!! Note "Explanation"
    In this example, the `execute` command will first run the `template` command with the `test.qaas.yaml` configuration and then run the `run` command with the same configuration.

---

## Positional Arguments

| Position | Property            | Source Type       | Required | Default         | Value Type | Description                                                                                             |
|----------|---------------------|-------------------|----------|-----------------|------------|---------------------------------------------------------------------------------------------------------|
| `0`      | `ConfigurationFile` | `Execute options` | Yes      | executable.yaml | `string`   | Path to a yaml configuration file that contains a list of QaaS commands to execute in sequential order. |

## Flags

| Flag                                | Inherited | Required | Default | Value Type                 | Description                                                                                                                                                                                                                                                                                                                                                                                          |
|-------------------------------------|-----------|----------|---------|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-c`, `--command-ids-to-run`        | No        | No       | []      | `string list`              | Ids of the commands to run. Only the commands given would run. If none is given runs all commands.                                                                                                                                                                                                                                                                                                   |
| `--disable-elastic-defaults`        | Yes       | No       | False   | `bool`                     | Disables Elastic defaults registered through the runtime defaults provider for this run.                                                                                                                                                                                                                                                                                                             |
| `--elastic-password`                | Yes       | No       |         | `string`                   | Optional Elasticsearch password for the logger sink.                                                                                                                                                                                                                                                                                                                                                 |
| `--elastic-uri`                     | Yes       | No       |         | `string`                   | Elasticsearch URI used by the logger sink when send-logs is enabled.                                                                                                                                                                                                                                                                                                                                 |
| `--elastic-username`                | Yes       | No       |         | `string`                   | Optional Elasticsearch username for the logger sink.                                                                                                                                                                                                                                                                                                                                                 |
| `-e`, `--empty-allure-directory`    | No        | No       | False   | `bool`                     | If flag is enabled will automatically empty the allure results directory before running.                                                                                                                                                                                                                                                                                                             |
| `-g`, `--logger-configuration-file` | Yes       | No       |         | `string`                   | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag.                                                                                                                                                                                                                                                       |
| `-l`, `--logger-level`              | Yes       | No       |         | `LogEventLevel (optional)` | The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug,<br />Information, Warning, Error, Fatal.                                                                                                                                                         |
| `--no-process-exit`                 | No        | No       | False   | `bool`                     | When this flag is used the runner will not terminate the current process after it completes. Useful when embedding QaaS.Runner and orchestrating multiple runners in a single host process.                                                                                                                                                                                                          |
| `--send-logs`                       | Yes       | No       | False   | `bool`                     | Whether to send logs to the configured Elasticsearch sink.                                                                                                                                                                                                                                                                                                                                           |
| `-s`, `--serve-results`             | No        | No       | False   | `bool`                     | If flag is enabled will automatically serve the test results in a human readable manner using allure after executing all commands.<br />when any of the commands written in the executable configuration file use this flag it will not do anything, this is the deciding flag.<br />Uses a locally installed allure CLI tool, if allure CLI is not installed and added to path the serve will fail. |

Each `Commands` item contains the full QaaS command string and the unique `Id` that the loader uses for filtering and reporting.
