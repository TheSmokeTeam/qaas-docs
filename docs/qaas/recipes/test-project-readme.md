---
id: qaas.recipes.test-project-readme
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, framework]
keywords: [recipes, readme, test-project, conventions, documentation]
summary: "Author a README for a QaaS test project that explains how to run, override, and debug the test without code access."
---
# Test project README

> TL;DR — Every QaaS test project should ship a README that lists prerequisites, the canonical `dotnet run` invocations, the override knobs, and where session data and reports land.

## When to use {: #when-to-use}

- You own a test project (`*.QaaS.Runner.csproj`) and want consumers to run it without reading the source.
- You want a single document that maps to the four Runner commands: `run`, `act`, `assert`, `template`.
- You want overrides via flags and environment variables documented in one place.

## README skeleton {: #skeleton}

Use the following Markdown skeleton verbatim. Replace bracketed values with project specifics.

```markdown
# [Project] — QaaS test project

## Prerequisites

- .NET 10 SDK
- Docker (when the test starts a dependency container)
- Optional: Allure CLI to view reports locally

## Layout

- `test.qaas.yaml` — base configuration
- `cases/` — per-case YAML overlays (one file per case)
- `Reference/` — shared YAML fragments pushed via `-p`
- `Fixtures/` — payloads, schemas, expected outputs
- `Storage/` — produced session data and reports (git-ignored)

## Run

```bash
dotnet run -- run test.qaas.yaml
```

## Capture only (no assertions)

```bash
dotnet run -- act test.qaas.yaml
```

## Re-assert against captured data

```bash
dotnet run -- assert test.qaas.yaml
```

## Preview the resolved YAML

```bash
dotnet run -- template test.qaas.yaml
```

## Common overrides

| Need | Command |
| ---- | ------- |
| Override a value | `dotnet run -- run test.qaas.yaml -r MetaData:Environment=qa` |
| Layer overrides from a file | `dotnet run -- run test.qaas.yaml -w local.qaas.yaml` |
| Layer all YAML in a folder | `dotnet run -- run test.qaas.yaml -f overlays/qa` |
| Filter cases | `dotnet run -- run test.qaas.yaml -c cases -n smoke` |
| Filter sessions | `dotnet run -- run test.qaas.yaml -i Checkout` |
| Filter assertions | `dotnet run -- run test.qaas.yaml -a HttpStatus_200` |
| Disable env overlay | `dotnet run -- run test.qaas.yaml --no-env` |
| Serve Allure results | `dotnet run -- run test.qaas.yaml -s allure-results` |

## Environment overlay

Environment variables override loaded configuration when `--no-env` is not set.
The colon delimiter in flag arguments becomes a double underscore in environment names:

```bash
export MetaData__Environment=qa
dotnet run -- run test.qaas.yaml
```

## Acceptance criteria {: #acceptance}

- The README answers the four operational questions: how to run, how to capture, how to re-assert, how to preview.
- The override table covers `-r`, `-w`, `-f`, `-c`, `-n`, `-i`, `-a`, `--no-env`, and `-s`.
- Every command in the README is copy-paste runnable against the project's checked-in `test.qaas.yaml`.

## See also {: #see-also}

- [Runner commands](../userInterfaces/runner/commands/commands.md)
- [YAML mechanics](../advancedConcepts/yaml-mechanics.md)
- [Public contract](../public-contract.md)
