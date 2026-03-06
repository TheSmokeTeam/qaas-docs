# Run Test

## Run Test Locally

To execute the full runner flow, open a terminal in the project directory that contains `test.qaas.yaml` and run:

```bat
dotnet run -- run test.qaas.yaml -s
```

### Notes

- `run` performs the full test flow: resolve configuration, execute sessions, and execute assertions.
- `-s` / `--serve-results` serves the generated Allure report after assertions complete.
- `--` separates `dotnet run` arguments from QaaS command arguments.

Useful variants:

```bat
dotnet run -- template test.qaas.yaml
dotnet run -- run test.qaas.yaml -l Debug
dotnet run -- act test.qaas.yaml
dotnet run -- assert test.qaas.yaml -s
```

Use:

- `template` when you want to inspect the resolved configuration without executing it
- `act` when you want to collect session data without asserting yet
- `assert` when you already have stored session data and only want to run assertions

### Test Execution Output

After running the command, you will see logs in the console showing the progress of the test run. These logs provide information about session execution, data generation, publishing, consuming, and assertion results. Upon completion, the test generates results in the `allure-results` folder in the current directory.

```plaintext
DummyAppTests/
|--NuGet.Config
|--DummyAppTests.sln
|--README.md
|--.gitignore
|--DummyAppTests/
|----DummyAppTests.csproj
|----Program.cs
|----JsonArrayGenerator.cs
|----LengthAssertion.cs
|----test.qaas.yaml
|----Variables/
|------local.yaml
|------k8s.yaml
|----TestData/...
|----allure-results/
```

---

## Debugging

If you encounter issues during test execution, enable detailed logging by setting the log level to `Debug` using the `-l` flag:

```bat
dotnet run -- run test.qaas.yaml -l Debug -s
```

This increases the verbosity of the logs, providing deeper insight into:

- Data source processing
- Session lifecycle
- Publisher and consumer behavior
- Assertion evaluation

Use this for troubleshooting configuration issues, data flow problems, or unexpected test failures. For configuration-only debugging, `template` is usually faster than a full run.

---

## View Test Results Using Allure

To view the test results manually (especially if you did not use the `-s` flag or want to inspect existing results), run:

```bat
allure serve
```

from the `DummyAppTests/DummyAppTests/` directory (the directory containing the `allure-results` folder).

### What Happens

- The `allure serve` command starts a local HTTP server.
- It automatically opens a web-based UI in your default browser.
- The UI displays a detailed report of the test run, including:
  - Test cases and their status (passed/failed)
  - Execution timelines
  - Logs and attachments
  - Metrics and charts (e.g., throughput, delay, hermeticity)

### Sharing Results

You can share the test results by distributing the entire `allure-results` folder. Anyone with Allure CLI installed can view the report locally by running:

```bat
allure serve
```

from the directory containing the `allure-results` folder.
