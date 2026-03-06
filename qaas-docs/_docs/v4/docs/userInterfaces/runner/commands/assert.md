# Assert

The `assert` command executes only the assertion side of a test. Instead of running sessions again, it reads previously stored session data from the configured storages.

## Usage

```bash
dotnet run -- assert <configuration-file> [shared-runnable-options] [shared-logging-options] [assert-options]
```

To see the generated help text from the runner itself:

```bash
dotnet run -- assert --help
```

## Assert-Specific Options

| Flag | Purpose |
|---|---|
| `-s`, `--serve-results` | Serve the Allure report automatically after assertions complete. |
| `-e`, `--empty-results-directory` | Empty the results directory before assertions start. |

## When To Use `assert`

Use `assert` when:

- the session data already exists in storage
- you want to re-run only the assertion logic after changing an assertion implementation
- multiple teams share the same recorded session data but use different assertion sets
