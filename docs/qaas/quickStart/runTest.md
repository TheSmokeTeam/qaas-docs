# Run Test

## Run Test Locally

To execute the QaaS project, open a terminal in the `DummyAppTests/DummyAppTests` directory and run:

```bash
dotnet run -- run test.qaas.yaml -s
```

### Notes

- **The `-s` flag**: Automatically opens the Allure report in your default browser after the test completes. This only works if the Allure CLI is installed and added to your system's PATH.

- **The `--` separator**: This is a standard convention in command-line interfaces to indicate the end of command-line options. Everything after `--` is treated as arguments, even if they begin with a hyphen (`-`).

### Test Execution Output

After running the command, you will see logs in the console showing the progress of the test run. These logs provide information about session execution, data generation, publishing, consuming, and assertion results.

Upon completion, the test generates results in the `allure-results` folder located in the current directory.

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

## Debugging

If you encounter issues during test execution, enable detailed logging by setting the log level to `Debug` using the `-l` flag:

```bash
dotnet run -- run test.qaas.yaml -l Debug -s
```

This increases the verbosity of the logs, providing deeper insight into:

- Data source processing
- Session lifecycle
- Publisher and consumer behavior
- Assertion evaluation

Use this for troubleshooting configuration issues, data flow problems, or unexpected test failures.

## View Test Results Using Allure

To view the test results manually (especially if you did not use the `-s` flag or want to inspect existing results), run:

```bash
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

![allure-results-ui](../assets/allure-results.png)

### Sharing Results

You can share the test results by distributing the entire `allure-results` folder. Anyone with Allure CLI installed can view the report locally by running:

```bash
allure serve
```

from the directory containing the `allure-results` folder.
