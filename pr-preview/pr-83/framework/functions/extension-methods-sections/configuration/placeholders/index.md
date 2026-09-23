# Extension Methods: Configuration / Placeholders

> TL;DR — This page mirrors the `Configuration / Placeholders` section from [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `AddPlaceholderResolver`

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

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Extension Methods](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/extension-methods/index.md)
