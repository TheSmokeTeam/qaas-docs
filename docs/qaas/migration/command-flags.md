---
id: qaas.migration.command-flags
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [migration, cli, flags, commands]
summary: "Map removed and renamed Runner CLI flags from 1.x to 2.x, and list the new flags that replace them."
---
# Migration: Command flags

> TL;DR — Several 1.x flags were removed in favour of explicit stage selection (`--run-until-stage`), environment opt-out (`--no-env`), and unified result serving (`--serve-results`).

## When to use {: #when-to-use}

- Your CI invokes the Runner with 1.x flag names.
- You rely on legacy short aliases that were retired.

## Flag map {: #flag-map}

| 1.x flag | 2.x replacement | Notes |
| -------- | --------------- | ----- |
| `--stage <int>` | `--run-until-stage <int>` | Runs every session up to and including the given stage. |
| `--env-off` | `--no-env` | Disables environment overlay of the loaded configuration. |
| `--exit-here` | `--no-process-exit` | Returns the exit code without terminating the host process. |
| `--allure-serve` | `--serve-results [folder]` | Bare `-s` serves `allure-results`; passing a folder serves that folder. |
| `--clear-out` | `--empty-results-directory` | Empties the results directory before the run. |
| `--filter-case <name>` | `--cases-names <name>` | Repeatable. Pair with `--cases-names-ignore` for exclusions. |
| `--ignore-case-regex <expr>` | `--cases-name-patterns-ignore <expr>` | Regex matched against case names. |

## Removed flags {: #removed}

- `--quiet` is replaced by `--logger-level Warning` or `Error`.
- `--debug` is replaced by `--logger-level Debug` or `Verbose`.
- `--report-only` is replaced by the `assert` command run after `act`.

## Worked example {: #worked-example}

```bash
# 1.x
dotnet run -- run test.qaas.yaml --stage 2 --env-off --allure-serve --clear-out

# 2.x
dotnet run -- run test.qaas.yaml --run-until-stage 2 --no-env --serve-results --empty-results-directory
```

## Edge cases {: #edge-cases}

- `--serve-results` without a value serves the raw results folder `allure-results`. With a value such as `allure-report` it serves the generated report directory.
- `--no-process-exit` writes the exit code to the current process but does not terminate it. Embedding hosts read the code from `RunAndGetExitCode()`.
- `--logger-level` overrides both the default level and any level supplied through `--logger-configuration-file`.

## See also {: #see-also}

- [Runner commands](../userInterfaces/runner/commands/commands.md)
- [Public contract](../public-contract.md)
