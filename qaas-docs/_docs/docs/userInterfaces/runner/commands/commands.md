# Commands

A `QaaS.Runner` project is a regular .NET project that exposes QaaS-specific CLI verbs. Those verbs control how the same configuration is loaded and which parts of the execution pipeline actually run.

If a runner project is started without a verb, it prints the available commands and exits.

## Syntax

```bash
dotnet run <dotnet-parameters> -- <qaas-command> [arguments] [flags]
```

## Command Summary

| Command | Purpose |
|---|---|
| `run` | Execute sessions and assertions in one pass. |
| `act` | Execute only the session side and persist session data to the configured storages. |
| `assert` | Execute only the assertion side against existing session data from storage. |
| `template` | Print the resolved configuration after file, case, reference, argument, and optional environment-variable resolution. |
| `execute` | Execute a list of QaaS commands from an execution YAML file. |

## Shared Runnable Options

The `run`, `act`, `assert`, and `template` commands all share the same base configuration-loading flags:

| Flag | Purpose |
|---|---|
| `<configuration-file>` | Path to the main QaaS YAML file. Defaults to the runner's standard config file name if omitted. |
| `-w`, `--with-files` | Apply one or more overwrite YAML files on top of the base configuration, in the order provided. |
| `-r`, `--overwrite-arguments` | Override individual configuration values from the command line, for example `MetaData:Team=QA`. |
| `-p`, `--push-references` | Push reference YAML fragments into root-level lists such as `Sessions` or `Assertions`. |
| `-c`, `--cases` | Directory containing case files. Each case is loaded on top of the base configuration. |
| `-n`, `--cases-names` | Restrict execution to selected case names. |
| `-i`, `--session-names` | Restrict execution to selected session names. |
| `--session-categories` | Restrict execution to selected session categories. |
| `-a`, `--assertion-names` | Restrict execution to selected assertion names. |
| `--assertion-categories` | Restrict execution to selected assertion categories. |
| `--resolve-cases-last` | Resolve cases after references instead of before them. |
| `--no-env` | Disable environment-variable enrichment of the resolved configuration. |

## Shared Logging Options

All commands also support the logger flags provided by `QaaS.Framework.Executions`:

| Flag | Purpose |
|---|---|
| `-l`, `--logger-level` | Override the effective log level. |
| `-g`, `--logger-configuration-file` | Load a custom logger configuration file. |
| `--send-logs` | Enable or disable the Elastic logger sink. |
| `--elastic-uri` | Override the Elastic URI used by the logger sink. |
| `--elastic-username` | Optional Elastic username. |
| `--elastic-password` | Optional Elastic password. |

Use the individual command pages for the options that only apply to `run`, `assert`, or `execute`.
