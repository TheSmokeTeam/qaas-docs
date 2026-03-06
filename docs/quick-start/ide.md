# IDE and Validation

## Recommended Editors

- Rider for C#-first QaaS projects
- VS Code when the team prefers lightweight YAML editing

## Current State of Schema Support

The workspace code contains rich configuration metadata through `Description`, validation attributes, and builder types, but this repository does not ship a checked-in YAML schema artifact. Because of that, the reliable validation loop today is:

1. edit YAML in your IDE
2. run `template` to see the fully loaded configuration
3. run the actual command you care about

## Fast Validation Commands

Render the merged configuration:

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- template test.qaas.yaml
```

Run with debug logs:

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- run test.qaas.yaml -l Debug
```

These two commands catch most authoring mistakes faster than waiting for a full environment deployment.

## IDE Setup That Still Helps

### Rider

- Enable YAML support.
- Mark your test project as the startup project.
- Create run configurations for `run`, `act`, `assert`, and `template`.
- Keep `Variables/` and `Cases/` visible in the project tree so environment overlays are not hidden.

### VS Code

- Install the C# extension and a YAML extension.
- Create tasks for `dotnet build`, `dotnet run -- run`, and `dotnet run -- template`.
- Use workspace snippets for common sections such as `DataSources`, `Sessions`, and `Assertions`.

## Practical Rule

Use the IDE for authoring speed, not as the source of truth. The source of truth is the runner loading the configuration successfully.
