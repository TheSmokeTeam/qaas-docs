# Run

The `run` command executes the full test flow defined by the resolved configuration: sessions first, then assertions.

## Usage

```bash
dotnet run -- run <configuration-file> [shared-runnable-options] [shared-logging-options] [run-options]
```

To see the generated help text from the runner itself:

```bash
dotnet run -- run --help
```

## Run-Specific Options

| Flag | Purpose |
|---|---|
| `-s`, `--serve-results` | Serve the Allure report automatically after assertions complete. |
| `-e`, `--empty-results-directory` | Empty the results directory before the run starts. |

## When To Use `run`

Use `run` when:

- you want the simplest local developer workflow
- sessions and assertions should happen in one command
- you want optional automatic Allure serving at the end

Use `act` and `assert` separately only when you need to persist session data and re-assert it later.
