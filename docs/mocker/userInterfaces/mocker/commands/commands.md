# Commands

A QaaS Mocker project accepts verb-style CLI commands in the same way as QaaS Runner.

Running the project without a command defaults to `run`, so both of the following forms are valid:

```bash
dotnet run -- mocker.qaas.yaml
dotnet run -- run mocker.qaas.yaml
```

The supported commands are:

| Command | Purpose |
| ------- | ------- |
| `run` | Start the configured servers and optional controller |
| `lint` | Validate the configuration without starting any runtime listeners |
| `template` | Render the effective merged YAML after files, folders, arguments, and environment overrides are applied |

Common flags available across the commands:

| Flag | Purpose |
| ---- | ------- |
| `--overwrite-files` | Apply one or more YAML overlay files after the base configuration |
| `--overwrite-folders` | Apply every YAML file in one or more folders in alphabetical order |
| `--overwrite-arguments` | Override individual configuration paths such as `Servers:0:Http:Port=8080` |
| `--no-env` | Disable environment-variable based configuration overrides |
| `--run-locally` | Keep the process attached to the local console and stop on key press |
| `--output-folder` | Write generated template output to a folder when using `template` |

See the dedicated command pages for usage examples: [run](run.md) | [lint](lint.md) | [template](template.md)
