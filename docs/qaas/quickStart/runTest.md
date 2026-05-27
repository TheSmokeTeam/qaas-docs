---
id: qaas.quickstart.runtest
type: tutorial
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [qaas, quickstart, runtest]
summary: "Once the local quick-start environment is ready, run the sample from the project directory."
---
# Run Test

> TL;DR — Run the sample Runner configuration from the project directory and inspect the generated results.

Once the local quick-start environment is ready, run the sample from the project directory.

## YAML Sample {: #yaml-sample}

```bash
dotnet run -- run test.qaas.yaml
```

## Code Sample {: #code-sample}

```bash
dotnet run
```

## Output {: #output}

Both variants write execution artifacts to `allure-results`. If you want to pass explicit Runner flags for the code sample, use the normal Runner command form after `dotnet run --`.

If you have the Allure CLI installed, you can serve the report locally:

```bash
allure serve
```

## See also {: #see-also}

- [Write a test in YAML](writeTestYaml.md)
- [Write a test in code](writeTestCode.md)
- [`run` command](../userInterfaces/runner/commands/run.md)
- [Debug test failure](debugTestFailure.md)
