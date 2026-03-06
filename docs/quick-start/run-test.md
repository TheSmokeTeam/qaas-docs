# Run a Test

## Standard Run

From the directory that contains `test.qaas.yaml`:

```powershell
dotnet run -- run test.qaas.yaml -w Variables/local.yaml -s
```

What this does:

- loads the base file
- merges `Variables/local.yaml`
- runs sessions and assertions
- writes Allure results
- serves the report automatically because of `-s`

## The Core Commands

| Command | What it does | Typical use |
| --- | --- | --- |
| `run` | Full run: act + assert | Normal test execution |
| `act` | Runs data sources and sessions only | Capture real traffic or generated outputs |
| `assert` | Runs assertions against stored data | Re-evaluate without re-sending traffic |
| `template` | Renders the resolved configuration | Validate merges, cases, placeholders, and defaults |
| `execute` | Runs a YAML file that contains multiple runner commands | Pipelines and multi-step suites |

## Useful Examples

Run with debug logs:

```powershell
dotnet run -- run test.qaas.yaml -w Variables/local.yaml -l Debug
```

Render the final configuration:

```powershell
dotnet run -- template test.qaas.yaml -w Variables/local.yaml
```

Split act and assert:

```powershell
dotnet run -- act test.qaas.yaml -w Variables/local.yaml
dotnet run -- assert test.qaas.yaml -w Variables/local.yaml
```

Run only selected cases:

```powershell
dotnet run -- run test.qaas.yaml -c Cases -n Cases/regular.yaml
```

## Results

- Runner reports go to `allure-results/`.
- `-s` and `execute --serve-results` rely on a locally installed Allure CLI.
- If the report does not open automatically, run `allure serve` in the directory that contains `allure-results/`.
