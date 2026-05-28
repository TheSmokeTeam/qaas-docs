# Placeholders: When to use

> TL;DR — Reference page for Placeholders: When to use.

This page mirrors the `When to use` section from [Placeholders](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/placeholders/index.md).

Use this page when you need source-backed signatures, declaring types, and XML doc comments for this function category.

Each entry uses the short function name as the table-of-contents label. Expand an entry to inspect its source file, signature, and XML doc comments.

## `AddPlaceholderResolver`

Source file, signature, and docstring

**Member** `PlaceholderConfigurationBuilderExtension.AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)`

**Kind** `function`

**Declaring Type** `PlaceholderConfigurationBuilderExtension (extension type)`

**Source File** `QaaS.Framework.Configurations/ConfigurationBuilderExtensions/PlaceholderConfigurationBuilderExtension.cs`

**Signature**

```csharp
public static IConfigurationBuilder AddPlaceholderResolver(this IConfigurationBuilder configurationBuilder)
```

**Docstring**

Adds the placeholder-resolving configuration source to the configuration builder.

Call this extension before building IConfiguration when placeholder expansion should be applied as part of the configuration pipeline.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
