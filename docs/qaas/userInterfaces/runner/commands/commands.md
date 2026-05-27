# Commands

QaaS Runner commands all start from the same host process and then branch into focused execution modes depending on whether you want to inspect configuration, run sessions, evaluate assertions, or orchestrate multiple commands.

## Invocation Pattern

```bash
dotnet run <dotnet-parameters> -- <command> [command-values] [command-flags]
```

## Available Commands

| Command | Description | Best For |
| ------- | ----------- | -------- |
| [`act`](./act.md) | Run a qaas test without the assertions and save all sessionData. | Execute only the session phase and persist SessionData for later inspection. |
| [`assert`](./assert.md) | Run a qaas test with only the assertions on already existing sessionData. | Evaluate only the assertion phase against existing SessionData. |
| [`execute`](./execute.md) | Executes a yaml execution file that contains a list of other commands to execute in a sequential order. The flags of all commands in the execution file that can also be given in the execute command ('s', 'e', 'l', 'g') will be ignored. | Run a YAML-defined sequence of Runner commands. |
| [`run`](./run.md) | Run a qaas test according to the given configurations. | Run the full QaaS flow: sessions, assertions, reporting, and optional Allure serving. |
| [`template`](./template.md) | Template a qaas configuration file to see how it looks after being loaded, will template what it can even if the configuration file is invalid. | Render the fully resolved Runner configuration without executing it. |

## Common Flags

| Category | Flag | Default | Type | Description |
| -------- | ---- | ------- | ---- | ----------- |
| Logging | `--disable-elastic-defaults` | False | `bool` | Disables Elastic defaults registered through the runtime defaults provider for this run. |
| Logging | `--elastic-password` |  | `string` | Optional Elasticsearch password for the logger sink. |
| Logging | `--elastic-uri` |  | `string` | Elasticsearch URI used by the logger sink when send-logs is enabled. |
| Logging | `--elastic-username` |  | `string` | Optional Elasticsearch username for the logger sink. |
| Logging | `-g`, `--logger-configuration-file` |  | `string` | Path to a logger's configuration file, will override the default logger's configuration. Its level can be overridden by the logger-level flag. |
| Logging | `-l`, `--logger-level` |  | `LogEventLevel (optional)` | The logger's level, overrides both the default logger's level (Information) and the level of any logger's configuration given.<br />All available options (not case sensitive) are: Verbose, Debug,<br />Information, Warning, Error, Fatal. |
| Runtime | `--no-process-exit` | False | `bool` | When this flag is used the runner will not terminate the current process after it completes. Useful when embedding QaaS.Runner and orchestrating multiple runners in a single host process. |
| Logging | `--send-logs` | False | `bool` | Whether to send logs to the configured Elasticsearch sink. |

## Working Style

- Use `template` to inspect the resolved YAML before you execute anything.
- Use `run` for the standard end-to-end path.
- Use `act` followed by `assert` when you want to split data capture from assertion evaluation.
- Use `execute` when the workflow itself should be declared as YAML.

## Raw CLI Help

```text
ERROR(S):
  No verb selected.
Usage:
 dotnet run [Dotnet Parameters] -- [Command] [Values] [Flags]

  run         Run a qaas test according to the given configurations.

  act         Run a qaas test without the assertions and save all sessionData.

  assert      Run a qaas test with only the assertions on already existing sessionData.

  template    Template a qaas configuration file to see how it looks after being loaded, will template what it can even
              if the configuration file is invalid.

  execute     Executes a yaml execution file that contains a list of other commands to execute in a sequential order.
              The flags of all commands in the execution file that can also be given in the execute command ('s', 'e',
              'l', 'g') will be ignored.

  help        Display more information on a specific command.

  version     Display version information.

No-args guidance:
  Empty arguments only work for code-only hosts that choose a no-args path in Program.cs.
  If a YAML file is part of the scenario, pass it explicitly: dotnet run -- run <config-file>.
```
