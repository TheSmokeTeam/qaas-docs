# Extension Methods: Extension Methods / Configuration merge utilities

> TL;DR — This page mirrors the `Extension Methods / Configuration merge utilities` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `MergeConfigurationObjectIntoIConfiguration`

Source file, signature, and docstring

**Member** `ConfigurationMergeUtils.MergeConfigurationObjectIntoIConfiguration(this IConfiguration configuration, object? configurationObject)`

**Kind** `function`

**Declaring Type** `ConfigurationMergeUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBindingUtils/ConfigurationMergeUtils.cs`

**Signature**

```csharp
public static IConfiguration MergeConfigurationObjectIntoIConfiguration(this IConfiguration configuration, object? configurationObject)
```

**Docstring**

Merges a partial configuration object into an existing IConfiguration instance. Fields omitted from configurationObject are preserved from configuration . A field is treated as omitted when it still matches the default value produced by a fresh instance of the same configuration type.

### `MergeConfiguration<TConfiguration>`

Source file, signature, and docstring

**Member** `ConfigurationMergeUtils.MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)`

**Kind** `function`

**Declaring Type** `ConfigurationMergeUtils (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBindingUtils/ConfigurationMergeUtils.cs`

**Signature**

```csharp
public static TConfiguration? MergeConfiguration<TConfiguration>(this TConfiguration? currentConfiguration, TConfiguration? newConfiguration)
```

**Docstring**

Merges a partial configuration object into an existing configuration instance. When the incoming configuration type differs from the existing one, the incoming configuration replaces it. Fields that still match a fresh default instance of the incoming configuration type are ignored.

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
