---
id: qaas.quickstart.runtest
type: tutorial
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, quickstart, runtest]
summary: "Once the local quick-start environment is ready, run the sample from the project directory."
---
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
