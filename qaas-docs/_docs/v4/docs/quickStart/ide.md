# IDE

QaaS projects can be configured with YAML files, C# code, or a mix of both. For onboarding, YAML is usually the fastest path because the full test shape is visible in one place.

An IDE helps with three things:

- keeping indentation and anchors valid
- navigating between YAML, `Program.cs`, and your custom hooks
- running `dotnet run -- template ...` or `dotnet run -- run ...` quickly while you author a test

## Current Validation Workflow

The source code is the validation authority. The safest way to validate a configuration while you edit it is:

```bash
dotnet run -- template test.qaas.yaml
```

Use that command whenever you want to see the fully resolved configuration after overwrite files, cases, references, command-line overrides, and optional environment-variable enrichment have been applied.

If you want to execute the test immediately and inspect failures with full logs:

```bash
dotnet run -- run test.qaas.yaml -l Debug
```

## VS Code

Recommended extensions:

- `C# Dev Kit` or `C#`
- `YAML` by Red Hat

Useful settings:

```json
{
  "files.associations": {
    "*.qaas.yaml": "yaml"
  },
  "yaml.format.enable": true
}
```

Practical workflow in VS Code:

1. Open the solution root created by the project template.
2. Keep `test.qaas.yaml` and `Program.cs` side by side.
3. Run `dotnet run -- template test.qaas.yaml` from the integrated terminal after each meaningful YAML change.
4. Use `dotnet run -- run test.qaas.yaml -s` once the configuration resolves as expected.

## Rider

Rider works well for mixed YAML and C# QaaS projects because you can jump directly from hook names in your codebase to their implementations.

Recommended setup:

1. Open the solution root, not just the project folder.
2. Make sure YAML support is enabled.
3. Mark `*.qaas.yaml` as YAML files if Rider does not detect them automatically.
4. Create run configurations for:
   - `dotnet run -- template test.qaas.yaml`
   - `dotnet run -- run test.qaas.yaml -s`

## When You Need Stronger Validation

If your team publishes local JSON schemas or custom linting around QaaS YAML, wire them into the IDE as an extra layer. Treat the runner itself as the final source of truth because command-line options and code-based configuration can still change the final resolved object graph.
