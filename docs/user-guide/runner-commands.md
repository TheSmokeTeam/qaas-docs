# Runner Commands and Flags

`QaaS.Runner` parses five verbs from `Bootstrap`: `run`, `act`, `assert`, `template`, and `execute`.

## Verbs

| Verb | Source type | Result |
| --- | --- | --- |
| `run` | `RunOptions` | Full execution with assertions |
| `act` | `ActOptions` | Sessions only, no assertions |
| `assert` | `AssertOptions` | Assertions only against stored data |
| `template` | `TemplateOptions` | Renders the resolved configuration |
| `execute` | `ExecuteOptions` | Runs a YAML list of runner commands in order |

## Shared Runnable Flags

These apply to `run`, `act`, `assert`, and `template`.

| Flag | Meaning |
| --- | --- |
| positional `ConfigurationFile` | Base `test.qaas.yaml` file. Defaults to `test.qaas.yaml`. |
| `-w, --with-files` | Ordered overwrite files. Each file overwrites the previous result. |
| `-r, --overwrite-arguments` | Inline path-based overrides such as `MetaData:Team=Platform`. |
| `-p, --push-references` | Injects external YAML list fragments into root lists such as `Sessions` or `Assertions`. |
| `-c, --cases` | Folder or HTTP URL that contains case overlays. |
| `-n, --cases-names` | Restricts execution to named case files. |
| `-i, --session-names` | Runs only selected sessions. |
| `--session-categories` | Runs only sessions in matching categories. |
| `-a, --assertion-names` | Runs only selected assertions. |
| `--assertion-categories` | Runs only assertions in matching categories. |
| `--resolve-cases-last` | Applies case overlays after reference expansion instead of before it. |
| `--no-env` | Disables environment-variable enrichment of the loaded configuration. |

## Reporting Flags

`run` and `assert` inherit `AssertableOptions`.

| Flag | Meaning |
| --- | --- |
| `-s, --serve-results` | Automatically opens the Allure report after assertions finish. |
| `-e, --empty-results-directory` | Clears the results directory before execution. |

## Logger Flags

These come from `LoggerOptions`.

| Flag | Meaning |
| --- | --- |
| `-l, --logger-level` | Overrides the effective log level. |
| `-g, --logger-configuration-file` | Replaces the default logger configuration. |
| `--send-logs` | Enables or disables the elastic log sink. |
| `--elastic-uri` | Elastic endpoint for the log sink. |
| `--elastic-username` | Optional elastic username. |
| `--elastic-password` | Optional elastic password. |

## Execute-Only Flags

| Flag | Meaning |
| --- | --- |
| positional `ConfigurationFile` | Execution file. Defaults to `executable.yaml`. |
| `-c, --command-ids-to-run` | Runs only selected command IDs from the execution file. |
| `-s, --serve-results` | Serves results after all commands finish. |
| `-e, --empty-allure-directory` | Clears the results directory before the full execution list runs. |

## Example Execution File

```yaml
Commands:
  - Id: PreTest
    Command: run test.qaas.yaml -w Variables/local.yaml
  - Id: Act
    Command: act test.qaas.yaml -w Variables/k8s.yaml -c Cases
  - Id: Assert
    Command: assert test.qaas.yaml -w Variables/k8s.yaml -c Cases
```

## Notes That Matter

- `execute` refuses to run nested `execute` commands.
- Case folders can be local filesystem paths or HTTP URLs. The runner has explicit support for Artifactory-style HTTP case directories.
- `--cases-names` must match the relative case names the runner discovers, not just the filename stem.
