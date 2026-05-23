---
id: qaas.userinterfaces.runner.schema-extensions
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner, framework, jsonschema]
keywords: [json schema, AnyOfSchemaOption, JsonSchema attribute, schema generator, custom plugin family]
summary: "Register a new plugin family with QaaS.JsonSchemaExtensions by tagging the base with [JsonSchema] and emitting AnyOfSchemaOption discriminators, then regenerate the runner schema."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Configurations\CustomAttributes\JsonSchemaAttribute.cs -->
<!-- Verified-against: QaaS.JsonSchemaExtensions\QaaS.JsonSchemaExtensions\AnyOfSchemaOption.cs -->
<!-- Verified-against: QaaS.JsonSchemaExtensions\QaaS.SchemaGenerator\Program.cs -->
<!-- Verified-against: QaaS.JsonSchemaExtensions\QaaS.SchemaGenerator.Tools\Program.cs -->

# Runner — YAML Schema Extensions

> TL;DR — Tag the base of your plugin family with `[JsonSchema]`, expose an `IReadOnlyList<AnyOfSchemaOption>` discriminator, and re-run the schema generator. The runner's YAML editor and runtime validation pick up the new family immediately.

## When to use {: #when-to-use}

- You authored a new plugin family (a new assertion / generator / probe / processor base) and want IDE autocomplete plus runtime validation for its YAML.
- You want to add a custom discriminator value to an existing `anyOf` keyword.
- You need to understand the relationship between `[JsonSchema]`, `AnyOfSchemaOption`, and the schemas the runner downloads at startup.

## YAML configuration {: #yaml}

The generated schema is referenced from your test YAML via the `# yaml-language-server: $schema=...` comment so IDEs pick it up:

```yaml
# yaml-language-server: $schema=./schemas/runner.schema.json

MetaData:
  Team: Smoke
  System: SchemaDemo

Reporters:
  - Name: ConsoleOnly
    Reporter: ConsoleReporter         # value validated against the anyOf enum
    ReporterConfiguration:
      Verbose: true
```

The runner loads the schema at startup; unknown enum values fail with a precise message such as `value 'XYZReporter' not in [AllureReporter, ConsoleReporter]`.

## C# (CAC) usage {: #csharp}

### Tag the base {: #tag-the-base}

Every QaaS extension-point base type carries `[JsonSchema]`. The generator reflects on assemblies, collects types decorated this way, and produces one schema per concrete subclass:

```csharp
using QaaS.JsonSchemaExtensions;
using QaaS.Runner.Assertions;
using QaaS.Runner.Assertions.AssertionObjects;

[JsonSchema]
public abstract class BaseReporter<TConfiguration> : IReporter
    where TConfiguration : new()
{
    public TConfiguration Configuration { get; set; } = default!;
    public string Name { get; set; } = default!;
    public string AssertionName { get; set; } = default!;
    public bool SaveSessionData { get; set; }
    public bool SaveAttachments { get; set; }
    public bool DisplayTrace { get; set; }
    public long EpochTestSuiteStartTime { get; set; }

    public abstract void WriteTestResults(AssertionResult assertionResult);
}
```

### Register the discriminator {: #register-the-discriminator}

Each plugin family that participates in YAML `anyOf` exposes its options through `AnyOfSchemaOption`:

```csharp
using QaaS.JsonSchemaExtensions;

namespace MyReporters;

public record AllureReporterConfig;

public record ConsoleReporterConfig;

public static class ReporterSchemaOptions
{
    public static readonly IReadOnlyList<AnyOfSchemaOption> All = new[]
    {
        new AnyOfSchemaOption(
            EnumOption: "AllureReporter",
            ConfigurationType: typeof(AllureReporterConfig),
            Title: "Allure Reporter",
            Description: "Writes Allure-compatible JSON to allure-results/."),

        new AnyOfSchemaOption(
            EnumOption: "ConsoleReporter",
            ConfigurationType: typeof(ConsoleReporterConfig),
            Title: "Console Reporter",
            Description: "Prints results to stdout."),
    };
}
```

`AnyOfSchemaOption` is a sealed record:

```csharp
public sealed record AnyOfSchemaOption(
    string EnumOption,
    Type ConfigurationType,
    string Title,
    string? Description);
```

## Minimal example {: #example-minimal}

Project tree for an external schema-extension package:

```text
MySchemaExtensions/
└─ MySchemaExtensions/
   ├─ MySchemaExtensions.csproj
   ├─ ReporterSchemaOptions.cs
   ├─ AllureReporterConfig.cs
   └─ ConsoleReporterConfig.cs
```

`AllureReporterConfig.cs`:

```csharp
using System.ComponentModel;

namespace MyReporters;

public record AllureReporterConfig
{
    [Description("Output directory."), DefaultValue("allure-results")]
    public string OutputDir { get; set; } = "allure-results";
}
```

## Realistic example {: #example-realistic}

A production schema-extension package usually:

1. Ships the `[JsonSchema]`-decorated bases as NuGet.
2. Provides a `SchemaTargets.json` listing the assemblies the generator must load.
3. Runs the schema generator in CI, diffs the output against checked-in schemas, and fails the build on drift.

`SchemaTargets.json`:

```json
{
  "assemblies": [
    "MyReporters.dll",
    "MyAssertions.dll"
  ],
  "outputDirectory": "schemas",
  "discoveryMode": "AllPublicTypes"
}
```

CI fragment:

```yaml
- name: Regenerate schemas
  run: |
    dotnet run --project D:/QaaS/QaaS.JsonSchemaExtensions/QaaS.SchemaGenerator -- \
      --targets ./SchemaTargets.json --output ./schemas
    git diff --exit-code schemas/
```

## Edge cases {: #edge-cases}

- `AnyOfSchemaOption.EnumOption` must be unique across all options in the same family. Duplicates produce a malformed schema (last one wins).
- `ConfigurationType` must be a parameterless-constructible record or class — the generator instantiates it to walk its properties.
- `[JsonSchema]` on the base is required even if every subclass is also tagged; discovery walks the inheritance chain from the base.
- Schemas are not regenerated by `dotnet build`. They are produced by `QaaS.SchemaGenerator` and checked in. Forgetting to re-run it is the most common cause of "the runner says my new enum value is unknown".
- The runner caches schemas under the build output. After regenerating, clean `bin/` to force a reload.

## See also {: #see-also}

- [Runner — configuration sections](configurationSections/configurationSections.md)
- [Runner — configuration resolution priority](configurationResolutionPriority.md)
- [Assertions — custom authoring guide](../../../assertions/custom-authoring-guide.md)
