# Debug Failures

## First Moves

1. render the final configuration with `template`
2. rerun with `-l Debug`
3. isolate whether the issue is in traffic generation, protocol I/O, or assertions

## Commands That Help

Render the fully merged configuration:

```powershell
dotnet run -- template test.qaas.yaml -w Variables/local.yaml
```

Disable environment-variable overrides if the result looks wrong:

```powershell
dotnet run -- template test.qaas.yaml -w Variables/local.yaml --no-env
```

Run only the traffic side:

```powershell
dotnet run -- act test.qaas.yaml -w Variables/local.yaml
```

Run only assertions on stored data:

```powershell
dotnet run -- assert test.qaas.yaml -w Variables/local.yaml
```

## What Usually Breaks

| Symptom | Likely cause | Fastest check |
| --- | --- | --- |
| Hook not found | Configured name does not match compiled class name | Build the test project and inspect `Generator`, `Assertion`, or `Probe` names |
| No messages consumed | Wrong endpoint, routing key, queue, timeout, or serializer choice | Reduce the config to one publisher and one consumer |
| Assertion fails but traffic looks correct | Wrong `SessionNames`, input/output names, or assertion configuration | Run `act`, inspect session data, then rerun `assert` |
| A case behaves differently than expected | Overlay path or index is wrong | Render that exact case with `template` |
| Logging sink errors | `send-logs` is enabled without valid elastic settings | rerun with `--send-logs false` |

## Logger Controls

The runner exposes:

- `-l, --logger-level`
- `-g, --logger-configuration-file`
- `--send-logs`
- `--elastic-uri`
- `--elastic-username`
- `--elastic-password`

For local debugging, keep it simple:

```powershell
dotnet run -- run test.qaas.yaml -l Debug --send-logs false
```

## Report Inspection

If Allure is installed, use:

```powershell
allure serve
```

Do that in the directory that contains `allure-results/`. QaaS writes assertion status, relevant session data, attachments, and the rendered configuration template into the report.
