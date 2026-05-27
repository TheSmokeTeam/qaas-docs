---
id: generators.custom-authoring-guide
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators, framework, runner]
keywords: [generators, custom, generator, authoring, sdk, BaseGenerator, IGenerator]
summary: "Derive a custom generator from BaseGenerator<TConfig> in QaaS.Framework.SDK and wire it into a DataSource."
---

# Custom Generators — Authoring Guide

> TL;DR — A generator is an `IGenerator` hook that produces `IEnumerable<Data<object>>` from a configured source. Derive `BaseGenerator<TConfiguration>` and reference it from a `DataSources[]` entry.

## When to use {: #when-to-use}

- The built-in generator catalog (see [Available Generators](index.md)) does not parse the fixture shape you need.
- You want lazy projection (yield one record at a time) over a large fixture without buffering it in memory.
- You need typed coercion (`int`, `bool`, `decimal`) in the generator rather than the system-under-test.

## YAML configuration {: #yaml}

```yaml
DataSources:
  - Name: Users
    Generator: TypedCsv
    GeneratorConfiguration:
      Path: TestData/users.csv
      Delimiter: ","
      Columns: ["id:int", "name:string", "active:bool"]
```

`DataSources[].Name` and `DataSources[].Generator` are the only required fields; everything inside `GeneratorConfiguration` is your record shape.

## C# (CAC) usage {: #csharp}

Derive `BaseGenerator<TConfiguration>` from `QaaS.Framework.SDK.Hooks.Generator`. Override `Generate(IImmutableList<SessionData>, IImmutableList<DataSource>)` and `yield return` lazily.

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Generator;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.SessionDataObjects;

public sealed record MyConfig;

public sealed class MyGenerator : BaseGenerator<MyConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        // yield return Data<object> per record
        yield break;
    }
}
```

## Minimal example {: #example-minimal}

```csharp
public record ConstantConfig
{
    public int Count { get; set; } = 1;
    public string Body { get; set; } = "{}";
}

public sealed class Constant : BaseGenerator<ConstantConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> _,
        IImmutableList<DataSource> __)
    {
        for (var i = 0; i < Configuration.Count; i++)
            yield return new Data<object> { Body = System.Text.Encoding.UTF8.GetBytes(Configuration.Body) };
    }
}
```

## Realistic example {: #example-realistic}

Typed CSV generator that parses each row according to a `name:type` column schema and yields one JSON-encoded `Data<object>` per row.

```csharp
using System.Collections.Immutable;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Text.Json;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Generator;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace MyTests.Generators;

public record TypedCsvConfig
{
    [Description("Path to the CSV file, resolved relative to working directory.")]
    [Required]
    public string Path { get; set; } = default!;

    [Description("Field delimiter."), DefaultValue(",")]
    [StringLength(1, MinimumLength = 1)]
    public string Delimiter { get; set; } = ",";

    [Description("Header schema: 'name:type'. Types: string,int,long,bool,decimal,double.")]
    [Required]
    public List<string> Columns { get; set; } = new();
}

public sealed class TypedCsv : BaseGenerator<TypedCsvConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var schema = Configuration.Columns.Select(ParseHeader).ToImmutableList();
        var sep = Configuration.Delimiter[0];

        foreach (var line in File.ReadLines(Configuration.Path).Skip(1))
        {
            if (string.IsNullOrWhiteSpace(line)) continue;

            var cells = line.Split(sep);
            if (cells.Length != schema.Count)
                throw new InvalidDataException(
                    $"Row '{line}' has {cells.Length} columns; schema declares {schema.Count}.");

            var record = new Dictionary<string, object?>(schema.Count);
            for (var i = 0; i < schema.Count; i++)
                record[schema[i].Name] = Coerce(cells[i], schema[i].Type);

            yield return new Data<object>
            {
                Body = JsonSerializer.SerializeToUtf8Bytes(record),
            };
        }
    }

    private static (string Name, string Type) ParseHeader(string spec)
    {
        var parts = spec.Split(':', 2);
        if (parts.Length != 2)
            throw new InvalidDataException($"Column spec '{spec}' must be 'name:type'.");
        return (parts[0].Trim(), parts[1].Trim().ToLowerInvariant());
    }

    private static object? Coerce(string raw, string type)
    {
        if (string.IsNullOrEmpty(raw)) return null;
        return type switch
        {
            "string"  => raw,
            "int"     => int.Parse(raw, CultureInfo.InvariantCulture),
            "long"    => long.Parse(raw, CultureInfo.InvariantCulture),
            "bool"    => bool.Parse(raw),
            "decimal" => decimal.Parse(raw, CultureInfo.InvariantCulture),
            "double"  => double.Parse(raw, CultureInfo.InvariantCulture),
            _ => throw new InvalidDataException($"Unknown column type '{type}'."),
        };
    }
}
```

YAML:

```yaml
DataSources:
  - Name: Users
    Generator: TypedCsv
    GeneratorConfiguration:
      Path: TestData/users.csv
      Delimiter: ","
      Columns:
        - "id:int"
        - "name:string"
        - "age:int"
        - "active:bool"
        - "balance:decimal"
```

Combine multiple typed-CSV data sources with the built-in `Stacking` generator when fixtures live in several files:

```yaml
DataSources:
  - { Name: UsersUS, Generator: TypedCsv, GeneratorConfiguration: { Path: TestData/users-us.csv, Columns: ["id:int","region:string","name:string"] } }
  - { Name: UsersEU, Generator: TypedCsv, GeneratorConfiguration: { Path: TestData/users-eu.csv, Columns: ["id:int","region:string","name:string"] } }
  - Name: AllUsers
    Generator: Stacking
    GeneratorConfiguration:
      DataSourceNames: [UsersUS, UsersEU]
      ItemsPerSource: 100
```

## Registration and discovery {: #registration}

Custom generators are discovered by short type name. The runner scans referenced assemblies for types deriving from `BaseGenerator<>`. To wire one in:

1. Place the class in any namespace inside an assembly the runner loads (your test project, or a referenced library).
2. Reference the assembly from the project that hosts the YAML — a project reference or a NuGet package both work.
3. In YAML, set `Generator:` to the **simple type name** (e.g. `TypedCsv`), not the fully-qualified name.

```yaml
DataSources:
  - Name: Users
    Generator: TypedCsv        # simple type name
```

Two generators with the same simple name across assemblies will collide; rename one. The runner only discovers types whose assembly is already loaded in its `AppDomain` — a transitive dependency that nothing references will not be visible. Data annotations on `TConfiguration` (`[Required]`, `[Range]`) are validated before `Generate` is called.

After adding or renaming a custom generator, regenerate the YAML schema so editors pick up the new enum value. See [Schema extensions](../qaas/userInterfaces/runner/schema-extensions.md) for the regeneration command and the `bin/` cache flush.

## Edge cases {: #edge-cases}

- `Generate` returns `IEnumerable`, not `IAsyncEnumerable`. Do not call `.ToList()` before yielding — large CSVs would balloon memory.
- `File.ReadLines` is lazy and pairs naturally with `yield return`.
- Header row is skipped because the `Columns` config is the source of truth. If you want runtime header validation, parse the first line and assert it matches `Columns`.
- Empty cells become `null`, not the type's default. Downstream consumers must handle nullable JSON.
- CSVs with embedded commas or quotes are not handled by `String.Split`. Use a real CSV reader for those fixtures.

## See also {: #see-also}

- [Generators — Introduction](index.md)
- [Generators — FromCSV (built-in)](availableGenerators/FromCSV/overview.md)
- [DataSources reference](../qaas/userInterfaces/runner/configurationSections/dataSources/overview.md)
