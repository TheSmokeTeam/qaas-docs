# Extension Methods: Configuration / YAML

> TL;DR — This page mirrors the `Configuration / YAML` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `AddYamlFromHttpGet`

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

### `AddYaml`

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

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
