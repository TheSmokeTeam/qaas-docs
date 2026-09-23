# Run Test

> TL;DR — Run the sample Runner configuration from the project directory and inspect the generated results.

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

## See also

- [Write a test in YAML](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/writeTestYaml/index.md)
- [Write a test in code](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/writeTestCode/index.md)
- [`run` command](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/run/index.md)
- [Debug test failure](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/debugTestFailure/index.md)
