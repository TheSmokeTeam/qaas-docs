# Run Test

Start the local mock first, then run the Runner sample from the `DummyAppTests/DummyAppTests` directory.

## YAML Sample

```bash
dotnet run -- run test.qaas.yaml
```

## Code Sample

The code-first sample normalizes empty arguments to `run test.qaas.yaml`, so this also works:

```bash
dotnet run
```

## Output

Both variants write execution artifacts to `allure-results`. If you have the Allure CLI installed, you can serve the report locally:

```bash
allure serve
```
