# template

The `template` command renders the effective mocker configuration after file overlays, folder overlays, overwrite arguments, and environment-variable overrides have been applied.

## Usage

```bash
dotnet run -- template mocker.qaas.yaml
```

To write the rendered file to a folder instead of standard output:

```bash
dotnet run -- template mocker.qaas.yaml --output-folder artifacts/templates
```

Use `dotnet run -- template --help` to see only the `template` options, or `dotnet run -- --help` to print the full command overview and every command's help block.
