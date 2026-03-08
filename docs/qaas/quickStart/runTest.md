# Run Your First Test

## Run Locally

From your test project directory (e.g. `DummyAppTests/DummyAppTests`):

```bat
dotnet run -- run test.qaas.yaml
```

### Flags

| Flag | Description |
|---|---|
| `-s` | Open Allure report in browser after completion (Allure CLI must be on PATH) |
| `-l <level>` | Log level: `Verbose`, `Debug`, `Information`, `Warning`, `Error`. Default: `Information` |
| `-w <path>` | YAML variables file to merge into the configuration |
| `-r key=value` | Override a single config value (repeatable) |
| `-p` | Push config references to shared storage before running |
| `--help` | Print all available options |

### Example

```bat
dotnet run -- run test.qaas.yaml -l Debug -w Variables/local.yaml -s
```

## Allure Report

Results are written to `allure-results/` in the current directory. View them at any time:

```bat
allure serve
```

## Next Step

[Make your tests more maintainable →](makeTestMoreMaintainable.md)
