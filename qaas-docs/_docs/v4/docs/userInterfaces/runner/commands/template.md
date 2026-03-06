# Template

The `template` command resolves the configuration exactly as the runner would load it, then prints the resolved object graph without executing sessions or assertions.

## Usage

```bash
dotnet run -- template <configuration-file> [shared-runnable-options] [shared-logging-options]
```

To see the generated help text from the runner itself:

```bash
dotnet run -- template --help
```

## When To Use `template`

Use `template` when:

- you want to confirm overwrite files, cases, references, or command-line overrides are resolving correctly
- you need to debug why a session or assertion is missing from the final configuration
- you are authoring YAML and want feedback without running the full test
