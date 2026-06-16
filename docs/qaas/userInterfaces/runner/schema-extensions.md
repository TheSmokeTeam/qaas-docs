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

Assertions:
  - Name: PayloadSize
    Assertion: HasMinimumPayloadSize   # value validated against the anyOf enum
    AssertionConfiguration:
      MinimumBytes: 1024
```

The runner loads the schema at startup; unknown enum values fail with a precise message such as `value 'XYZAssertion' not in [HttpStatus, ObjectOutputJsonSchema, ...]`.

## C# (CAC) usage {: #csharp}

### Tag the base {: #tag-the-base}

Every QaaS extension-point base type carries `[JsonSchema]`. The generator reflects on assemblies, collects types decorated this way, and produces one schema per concrete subclass:

```csharp
using System.Collections.Immutable;
using QaaS.JsonSchemaExtensions;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Assertion;
using QaaS.Framework.SDK.Session.SessionDataObjects;

[JsonSchema]
public abstract class BaseAssertion<TConfiguration> : IAssertion
    where TConfiguration : new()
{
    public TConfiguration Configuration { get; set; } = default!;
    public string Name { get; set; } = default!;
    public string AssertionMessage { get; protected set; } = string.Empty;
    public string AssertionTrace { get; protected set; } = string.Empty;

    public abstract bool Assert(
        IImmutableList<SessionData> sessionData,
        IImmutableList<DataSource> dataSources);
}
```

### Register the discriminator {: #register-the-discriminator}

Each plugin family that participates in YAML `anyOf` exposes its options through `AnyOfSchemaOption`:

```csharp
using QaaS.JsonSchemaExtensions;

namespace MyAssertions;

public record HasMinimumPayloadSizeConfig;

public record HasExpectedStatusConfig;

public static class AssertionSchemaOptions
{
    public static readonly IReadOnlyList<AnyOfSchemaOption> All = new[]
    {
        new AnyOfSchemaOption(
            EnumOption: "HasMinimumPayloadSize",
            ConfigurationType: typeof(HasMinimumPayloadSizeConfig),
            Title: "Has minimum payload size",
            Description: "Checks every selected output payload size."),

        new AnyOfSchemaOption(
            EnumOption: "HasExpectedStatus",
            ConfigurationType: typeof(HasExpectedStatusConfig),
            Title: "Has expected status",
            Description: "Checks every selected output status code."),
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
   ├─ AssertionSchemaOptions.cs
   ├─ HasMinimumPayloadSizeConfig.cs
   └─ HasExpectedStatusConfig.cs
```

`HasMinimumPayloadSizeConfig.cs`:

```csharp
using System.ComponentModel;

namespace MyAssertions;

public record HasMinimumPayloadSizeConfig
{
    [Description("Minimum payload size in bytes."), DefaultValue(1024)]
    public int MinimumBytes { get; set; } = 1024;
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
