# YAML

> TL;DR — This page lists the public Framework functions in the `YAML` category.

## When to use

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

## `AddYamlFromHttpGet`

Source file, signature, and docstring

**Member** `YamlConfigurationBuilderExtension.AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)`

**Kind** `function`

**Declaring Type** `YamlConfigurationBuilderExtension (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs`

**Signature**

```csharp
public static IConfigurationBuilder AddYamlFromHttpGet(this IConfigurationBuilder builder, string yamlUrl, TimeSpan? timeout = null)
```

**Docstring**

Adds a YAML configuration source that is loaded through HTTP GET.

Call this extension during configuration bootstrap when YAML should be loaded remotely instead of from the local file system.

## `AddYaml`

Source file, signature, and docstring

**Member** `YamlConfigurationBuilderExtension.AddYaml(this IConfigurationBuilder builder, string yamlPath)`

**Kind** `function`

**Declaring Type** `YamlConfigurationBuilderExtension (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/YamlConfigurationBuilderExtension.cs`

**Signature**

```csharp
public static IConfigurationBuilder AddYaml(this IConfigurationBuilder builder, string yamlPath)
```

**Docstring**

Adds a YAML configuration source from a local file path or URL.

Call this extension during configuration bootstrap so YAML sources go through the same QaaS-aware loading path for files and remote URLs.

## See also

- [Framework Functions](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/index.md)
