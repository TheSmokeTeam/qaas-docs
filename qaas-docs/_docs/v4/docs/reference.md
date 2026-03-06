# Runner Reference

## Overview

`QaaS.Runner` exposes five verbs:

| Verb | Purpose |
| --- | --- |
| `run` | execute sessions and assertions in one pass |
| `act` | execute sessions only and persist session data |
| `assert` | load existing session data and evaluate assertions |
| `execute` | execute a YAML list of runner commands sequentially |
| `template` | render the merged configuration without executing it |

All runnable verbs inherit the same configuration loading model from `BaseOptions` and logger wiring from `LoggerOptions`.

## Architecture & Connections

- `ExecutionBuilder` is the top-level runner model. It owns `DataSources`, `Sessions`, `Storages`, `Assertions`, `Links`, and `MetaData`.
- `QaaS.Framework.Configurations` performs binding and recursive validation.
- `QaaS.Framework.Providers` resolves configured hooks into loaded generator, assertion, and probe instances.
- `QaaS.Runner.Sessions` executes staged actions and emits session data.
- `QaaS.Runner.Assertions` consumes session data and produces report artifacts.
- `QaaS.Runner.Storage` persists serialized session data to filesystem or S3.

## Quick Start

Install the package:

```bash
dotnet add package QaaS.Runner
```

Run the checked-in execution example:

```bash
dotnet run --project D:/QaaS/QaaS.Runner/QaaS.Runner -- execute D:/QaaS/QaaS.Runner/QaaS.Runner.E2ETests/executable.yaml
```

Minimal runnable files in the repository:

- base config: `QaaS.Runner.E2ETests/test.qaas.yaml`
- command list: `QaaS.Runner.E2ETests/executable.yaml`
- override files: `QaaS.Runner.E2ETests/Variables/*.yaml`

## Technical Reference

### Shared Logger Options

| Option | Meaning |
| --- | --- |
| `--logger-level` | overrides the effective Serilog level |
| `--logger-configuration-file` | loads an explicit logger config file |
| `--send-logs` | enables or disables the Elasticsearch sink path |
| `--elastic-uri` / `--elastic-username` / `--elastic-password` | runtime sink credentials when log shipping is enabled |

### Runnable Command Options

All of `run`, `act`, `assert`, and `template` share these options:

| Option | Meaning |
| --- | --- |
| positional `ConfigurationFile` | path to the root `.qaas.yaml` file |
| `-w, --with-files` | ordered overwrite files |
| `-r, --overwrite-arguments` | inline overrides such as `Path:To:Field=Value` |
| `-p, --push-references` | injects referenced YAML lists at root-level placeholders |
| `-c, --cases` | directory of case files |
| `-n, --cases-names` | limit execution to named cases |
| `-i, --session-names` | limit execution to named sessions |
| `--session-categories` | limit execution to session categories |
| `-a, --assertion-names` | limit execution to named assertions |
| `--assertion-categories` | limit execution to assertion categories |
| `--resolve-cases-last` | resolves case files after other configuration layers |
| `--no-env` | disables environment-variable overrides |

Additional verb-specific options:

| Verb | Extra options |
| --- | --- |
| `run` / `assert` | `--serve-results`, `--empty-results-directory` |
| `execute` | `--serve-results`, `--empty-allure-directory`, `--command-ids-to-run` |

### Root YAML Sections

`ExecutionBuilder` recognizes these top-level sections:

| Section | Type | What it controls |
| --- | --- | --- |
| `DataSources` | `DataSourceBuilder[]` | generator definitions and serialization rules |
| `Sessions` | `SessionBuilder[]` | staged traffic, probes, collectors, and mocker commands |
| `Storages` | `StorageBuilder[]` | filesystem or S3 persistence for `act` / `assert` flows |
| `Assertions` | `AssertionBuilder[]` | report-producing checks over session outputs |
| `Links` | `LinkBuilder[]` | Kibana, Prometheus, or Grafana deep links in reports |
| `MetaData` | `MetaDataConfig` | execution metadata injected into context and logs |

### Session Builder Surface

`SessionBuilder` is the operational center of a test case.

| Field | Meaning |
| --- | --- |
| `Name` | unique session identifier |
| `Stage` | session-level ordering; sessions with the same stage run together |
| `RunUntilStage` | truncates execution after a target stage |
| `Category` | filterable label for `--session-categories` |
| `SaveData` | keeps or discards session output after iteration |
| `TimeoutBeforeSessionMs` / `TimeoutAfterSessionMs` | fixed delays around the session |
| `Publishers` | outbound data senders |
| `Transactions` | request/response actions |
| `Consumers` | inbound readers |
| `Probes` | non-data-returning hooks |
| `Collectors` | third-party data fetchers |
| `MockerCommands` | runtime commands sent to `QaaS.Mocker` |
| `Stages` | per-stage timeout overrides |

### Assertion Builder Surface

| Field | Meaning |
| --- | --- |
| `Assertion` | hook implementation name |
| `Name` | report-facing assertion name |
| `Category` | filterable label for `--assertion-categories` |
| `SessionNames` / `SessionNamePatterns` | target session filters |
| `DataSourceNames` / `DataSourcePatterns` | extra data-source filters |
| `SaveSessionData` / `SaveAttachments` / `SaveTemplate` | report payload switches |
| `DisplayTrace` | controls whether assertion trace is emitted into the report |
| `Severity` | Allure severity mapping |
| `Links` | assertion-specific report links |
| `StatusesToReport` | status whitelist for the final report |

### Storage Builder Surface

| Field | Meaning |
| --- | --- |
| `JsonStorageFormat` | JSON output formatting (`Indented` or compact) |
| `FileSystem` | filesystem storage config from `QaaS.Framework.Configurations` |
| `S3` | bucket and prefix storage config for S3-compatible backends |

### Session Action Surfaces

Use the corresponding framework or package docs for protocol-specific payload formats. Inside the runner, the action builders add orchestration metadata around those protocol configs.

- `TransactionBuilder`: name, timeout, iterations, loop, sleep, policies, serializer/deserializer, `Http` or `Grpc` config.
- `ProbeBuilder`: name, stage, data-source filters, and probe-specific configuration payload.
- `MockerCommandBuilder`: name, stage, Redis controller settings, command type, and command payload.
- `PublisherBuilder`, `ConsumerBuilder`, and `CollectorBuilder`: data-source filters plus exactly one protocol/fetcher config.

## Troubleshooting & Links

- If `run` works but `assert` fails, inspect storage compatibility first. `assert` needs the exact serialized session-data format written by `act`.
- If `execute` ignores logger flags inside nested commands, that is by design. The outer `execute` command owns shared logging and serve-results behavior.
- If pushed references do not appear, verify the replacement keyword is not a YAML path and that the target section is one of the supported root lists.

Source and package links:

- Runner source: [TheSmokeTeam/QaaS.Runner](https://github.com/TheSmokeTeam/QaaS.Runner)
- CommandLineParser: [commandlineparser/commandline](https://github.com/commandlineparser/commandline)
- Allure NUnit docs: [allurereport.org/docs/nunit](https://allurereport.org/docs/nunit/)
- Serilog docs: [serilog wiki](https://github.com/serilog/serilog/wiki)
- StackExchange.Redis docs: [stackexchange.github.io/StackExchange.Redis](https://stackexchange.github.io/StackExchange.Redis/)
