# Run Test

Once the local quick-start environment is ready, run the sample from the project directory.

## YAML Sample

```bash
dotnet run -- run test.qaas.yaml
```

## Code Sample

```bash
dotnet run
```

## Output

Both variants write execution artifacts to `allure-results`. If you want to pass explicit Runner flags for the code sample, use the normal Runner command form after `dotnet run --`.

If you have the Allure CLI installed, you can serve the report locally:

```bash
allure serve
```
