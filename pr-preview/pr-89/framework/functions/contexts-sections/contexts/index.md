# Contexts: Contexts

> TL;DR — This page mirrors the `Contexts` section from [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md) as a focused reference.

## When to use

Use this page when you need the focused member list, signatures, and source notes for this section without scanning the full parent reference.

## C# (CAC) usage

### `ContextBuilder`

Source file, signature, and docstring

**Member** `ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`

**Kind** `constructor`

**Declaring Type** `ContextBuilder`

**Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`

**Signature**

```csharp
public ContextBuilder(string configurationFile, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
```

**Docstring**

Creates a context builder that starts from a base QaaS configuration file.

Use this constructor when the context should load its initial configuration from a file path before overwrite sources and reference resolution are applied.

### `ContextBuilder`

Source file, signature, and docstring

**Member** `ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)`

**Kind** `constructor`

**Declaring Type** `ContextBuilder`

**Source File** `QaaS.Framework.SDK/ContextObjects/ContextBuilder.cs`

**Signature**

```csharp
public ContextBuilder(IConfigurationBuilder configurationBuilder, IList<string>? referenceResolutionPaths = null, IList<string>? uniqueIdPathRegexes = null)
```

**Docstring**

Creates a context builder that starts from an existing configuration builder pipeline.

Use this constructor when configuration sources are assembled externally and should be handed to the QaaS context pipeline as-is.

## Edge cases

- This page is generated from the parent reference section; edit the source XML docs or generator when content needs to change.
- If a linked source member is renamed, regenerate the reference docs before changing prose by hand.

## See also

- [Contexts](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/contexts/index.md)
